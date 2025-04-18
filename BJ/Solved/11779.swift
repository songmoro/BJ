//
//  11779.swift
//  BJ
//
//  Created by 송재훈 on 3/21/25.
//


//5
//8
//1 2 2
//1 3 3
//1 4 1
//1 5 10
//2 4 2
//3 4 1
//3 5 1
//4 5 3
//1 5

import Foundation

struct PQ<T> {
    private var heap = [T]()
    private var compare: (T, T) -> Bool
    init(_ heap: [T], _ sort: @escaping (T, T) -> Bool) {
        self.heap = heap
        self.compare = sort
    }
    
    var isEmpty: Bool { heap.isEmpty }
    
    mutating func push(_ v: T) {
        heap.append(v)
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

let N = file.readInt()
let M = file.readInt()

var graph = [[(Int, Int)]](repeating: [], count: N + 1)

for _ in 0..<M {
    let (a, b, c) = (file.readInt(), file.readInt(), file.readInt())
    
    graph[a].append((b, c))
}

let (start, end) = (file.readInt(), file.readInt())

func dijkstra(_ start: Int) -> [(Int, [Int])] {
    var dist = [(Int, [Int])](repeating: (Int.max, []), count: N + 1)
    var pq = PQ<(Int, Int)>([(start, 0)]) { $0.1 < $1.1 }
    dist[start] = (0, [start])
    
    while !pq.isEmpty {
        let (current, cost) = pq.pop()!
        
        if cost > dist[current].0 { continue }
        
        for (next, weight) in graph[current] {
            let newDist = cost + weight
            
            if newDist < dist[next].0 {
                dist[next] = (newDist, dist[current].1 + [next])
                pq.push((next, newDist))
            }
        }
    }
    
    return dist
}

let path = dijkstra(start)[end]

print(path.0)
print(path.1.count)
print(path.1.reduce("", { $0 + String($1) + " " }))
