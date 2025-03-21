//
//  17835.swift
//  BJ
//
//  Created by 송재훈 on 3/21/25.
//


//6 10 2
//2 6 2
//1 4 1
//6 1 5
//2 5 1
//5 1 4
//4 5 6
//6 2 3
//3 5 1
//3 1 1
//5 2 2
//1 2

import Foundation

struct PriorityQueue<T> {
    private var heap: [T] = []
    private let compare: (T, T) -> Bool
    
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
        
        var i = 0
        let popped = heap.removeLast()
        
        while true {
            let (left, right) = (i * 2 + 1, i * 2 + 2)
            
            var next = i
            if left < heap.count, compare(heap[left], heap[next]) { next = left }
            if right < heap.count, compare(heap[right], heap[next]) { next = right }
            
            if next == i { break }
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

let (N, M, K) = (file.readInt(), file.readInt(), file.readInt())
var graph = [[(Int, Int)]](repeating: [], count: N + 1)
var destinations = [Int]()

for _ in 0..<M {
    let (U, V, C) = (file.readInt(), file.readInt(), file.readInt())
    graph[V].append((U, C))
}

for _ in 0..<K {
    destinations.append(file.readInt())
}

func dijkstra() -> (Int, Int) {
    var dist = [Int](repeating: Int.max, count: N + 1)
    var pq = PriorityQueue<(Int, Int)> { $0.1 < $1.1 }
    
    for destination in destinations {
        pq.push((destination, 0))
        dist[destination] = 0
    }
    
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
    
    var maxCity = 0
    var maxDistance = 0
    
    for i in 1...N where dist[i] != Int.max && maxDistance < dist[i] {
        (maxCity, maxDistance) = (i, dist[i])
    }
    
    return (maxCity, maxDistance)
}

var answer = dijkstra()

print(answer.0)
print(answer.1)
