//
//  1753.swift
//  BJ
//
//  Created by 송재훈 on 3/21/25.
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
    let compare: (T, T) -> Bool
    
    init(_ sort: @escaping (T, T) -> Bool) { self.compare = sort }
    
    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    var top: T? { heap.first }
    
    mutating func push(_ value: T) {
        heap.append(value)
        var i = heap.count - 1
        
        while i > 0, compare(heap[i], heap[(i - 1) / 2]) {
            heap.swapAt(i, (i - 1) / 2)
            i = (i - 1) / 2
        }
    }
    
    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        heap.swapAt(0, heap.count - 1)
        let popped = heap.removeLast()
        var i = 0
        
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
let INF = Int.max

let (V, E) = (file.readInt(), file.readInt())
let start = file.readInt()

var graph = [[(Int, Int)]](repeating: [], count: V + 1)
var dist = [Int](repeating: INF, count: V + 1)

for _ in 0..<E {
    let (u, v, w) = (file.readInt(), file.readInt(), file.readInt())
    graph[u].append((v, w))
}

var pq = PQ<(Int, Int)> { $0.1 < $1.1 }
pq.push((start, 0))
dist[start] = 0

while !pq.isEmpty {
    let (current, cost) = pq.pop()!
    if cost > dist[current] { continue }
    
    for (next, weight) in graph[current] {
        let newDist = cost + weight
        
        if newDist < dist[next] {
            dist[next] = newDist
            pq.push((next, newDist))
        }
    }
}

var answer = ""
for i in 1...V { answer.append((dist[i] == INF ? "INF" : String(dist[i])) + "\n") }

print(answer)

