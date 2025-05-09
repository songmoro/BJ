//
//  1504-2.swift
//  BJ
//
//  Created by 송재훈 on 5/10/25.
//

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
let (N, E) = (file.readInt(), file.readInt())
var graph = [[(Int, Int)]](repeating: [], count: N + 1)
for _ in 0..<E {
    let (a, b, c) = (file.readInt(), file.readInt(), file.readInt())
    graph[a].append((b, c))
    graph[b].append((a, c))
}
let (v1, v2) = (file.readInt(), file.readInt())

func dijkstra(_ start: Int) -> [Int] {
    var distance = [Int](repeating: Int.max, count: N + 1)
    var pq = PQ<(Int, Int)> { $0.1 < $1.1 }
    distance[start] = 0
    pq.push((start, 0))
    
    while !pq.isEmpty {
        let (current, cost) = pq.pop()!
        if cost > distance[current] { continue }
        
        for (next, weight) in graph[current] {
            let newDistance = cost + weight
            
            if newDistance < distance[next] {
                pq.push((next, newDistance))
                distance[next] = newDistance
            }
        }
    }
    
    return distance
}

let distance1 = dijkstra(1)
let distanceV1 = dijkstra(v1)
let distanceV2 = dijkstra(v2)
var cost1 = Int.max
var cost2 = Int.max

if distance1[v1] != Int.max, distanceV1[v2] != Int.max, distanceV2[N] != Int.max {
    cost1 = distance1[v1] + distanceV1[v2] + distanceV2[N]
}
if distance1[v2] != Int.max, distanceV2[v1] != Int.max, distanceV1[N] != Int.max {
    cost2 = distance1[v2] + distanceV2[v1] + distanceV1[N]
}

if min(cost1, cost2) == Int.max {
    print(-1)
}
else {
    print(min(cost1, cost2))
}
