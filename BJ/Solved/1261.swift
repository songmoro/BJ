//
//  1261.swift
//  BJ
//
//  Created by 송재훈 on 3/21/25.
//


//3 3
//011
//111
//110

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

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let MN = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N) = (MN[0], MN[1])

var maze = [[Int]]()

for _ in 0..<N {
    let input = readLine()!.map { Int(String($0))! }
    maze.append(input)
}

var dist = [[Int]](repeating: [Int](repeating: Int.max, count: M + 1), count: N + 1)
var pq = PQ<(Int, Int, Int)>([(0, 0, 0)]) { $0.2 < $1.2 }
dist[0][0] = 0

while !pq.isEmpty {
    let (i, j, cost) = pq.pop()!
    
    if i == N - 1, j == M - 1 {
        print(cost)
        break
    }
    
    for move in moves {
        let n = (i + move.0, j + move.1)
        
        if n.0 >= 0, n.1 >= 0, n.0 < N, n.1 < M {
            let newDist = cost + maze[n.0][n.1]
            
            if newDist < dist[n.0][n.1] {
                dist[n.0][n.1] = newDist
                pq.push((n.0, n.1, newDist))
            }
        }
    }
}
