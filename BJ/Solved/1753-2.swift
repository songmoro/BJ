//
//  1753-2.swift
//  BJ
//
//  Created by 송재훈 on 5/10/25.
//


//5 6
//1
//5 1 1
//1 2 2
//1 3 3
//2 3 4
//2 4 5
//3 4 6

import Foundation

struct PQ<T> {
    var heap = [T]()
    var compare: (T, T) -> Bool
    var isEmpty: Bool { heap.isEmpty }
    init(_ compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func push(_ value: T) {
        var i = heap.count
        heap.append(value)
        
        while i > 0, compare(heap[i], heap[(i - 1) / 2]) {
            heap.swapAt(i, (i - 1) / 2)
            i = (i - 1) / 2
        }
    }
    
    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        heap.swapAt(0, heap.count - 1)
        
        var i = 0
        let popped = heap.removeLast()
        
        while true {
            let (left, right) = (i * 2 + 1, i * 2 + 2)
            var next = i
            
            if left < heap.count, compare(heap[left], heap[next]) { next = left }
            if right < heap.count, compare(heap[right], heap[next]) { next = right }
            if i == next { break }
            
            heap.swapAt(i, next)
            i = next
        }
        
        return popped
    }
}

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() }
        let beginIndex = index - 1
        while now != 10, now != 32, now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() }
        let beginIndex = index - 1
        while now != 10, now != 32, now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let file = FileIO()

let (V, E) = (file.readInt(), file.readInt())
let start = file.readInt()
var graph = [[(Int, Int)]](repeating: [], count: V + 1)
var distance = [Int](repeating: Int.max, count: V + 1)
distance[start] = 0

for _ in 0..<E {
    let (u, v, w) = (file.readInt(), file.readInt(), file.readInt())
    graph[u].append((v, w))
}

var queue = PQ<(Int, Int)> { $0.1 < $1.1 }
queue.push((start, 0))

while !queue.heap.isEmpty {
    let (current, cost) = queue.pop()!
    if cost > distance[current] { continue }
    
    for (next, dist) in graph[current] {
        let newDistance = cost + dist
        
        if newDistance < distance[next] {
            distance[next] = newDistance
            queue.push((next, newDistance))
        }
    }
}

var answer = ""
for i in 1...V { answer.append((distance[i] == Int.max ? "INF" : String(distance[i])) + "\n") }
print(answer)
