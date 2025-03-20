//
//  11286.swift
//  BJ
//
//  Created by 송재훈 on 3/20/25.
//


//18
//1
//-1
//0
//0
//0
//1
//1
//-1
//-1
//2
//-2
//0
//0
//0
//0
//0
//0
//0

import Foundation

struct PriorityQueue<T: Comparable> {
    private var heap: [T] = []
    private let isHigherPriority: (T, T) -> Bool
    
    init(_ sort: @escaping (T, T) -> Bool) { self.isHigherPriority = sort }
    
    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    var top: T? { heap.first }

    mutating func push(_ value: T) {
        heap.append(value)
        var index = heap.count - 1
        while index > 0, isHigherPriority(heap[index], heap[(index - 1) / 2]) {
            heap.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }

    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        heap.swapAt(0, heap.count - 1)
        let popped = heap.removeLast()
        
        var index = 0
        while true {
            let left = index * 2 + 1, right = index * 2 + 2
            var next = index
            if left < heap.count, isHigherPriority(heap[left], heap[next]) { next = left }
            if right < heap.count, isHigherPriority(heap[right], heap[next]) { next = right }
            if next == index { break }
            heap.swapAt(index, next)
            index = next
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
var pq = PriorityQueue<Int> { (abs($0), $0) < (abs($1), $1) }

for _ in 0..<N {
    let x = file.readInt()
    if x == 0 { print(pq.pop() ?? 0) }
    else { pq.push(x) }
}
