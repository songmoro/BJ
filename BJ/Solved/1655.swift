//
//  1655.swift
//  BJ
//
//  Created by 송재훈 on 5/8/25.
//


//7
//1
//5
//2
//10
//-99
//7
//5

import Foundation

struct PQ<T> {
    var heap = [T]()
    var compare: (T, T) -> Bool
    var count: Int { heap.count }
    init(_ compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func push(_ value: T) {
        var i = count
        heap.append(value)
        
        while i > 0, compare(heap[i], heap[(i - 1) / 2]) {
            heap.swapAt(i, (i - 1) / 2)
            i = (i - 1) / 2
        }
    }
    
    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        if count == 1 { return heap.removeLast() }
        heap.swapAt(0, count - 1)
        
        var i = 0
        let popped = heap.removeLast()
        
        while true {
            let (left, right) = (i * 2 + 1, i * 2 + 2)
            var next = i
            
            if left < count, compare(heap[left], heap[next]) { next = left }
            if right < count, compare(heap[right], heap[next]) { next = right }
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
var numbers = [Int]()
for _ in 0..<N { numbers.append(file.readInt())}

var maxPQ = PQ<Int> { $0 < $1 }
var minPQ = PQ<Int> { $0 > $1 }
var answer = ""

for number in numbers {
    if minPQ.heap.isEmpty { minPQ.push(number) }
    else if minPQ.heap[0] < number { maxPQ.push(number) }
    else { minPQ.push(number) }
    
    if maxPQ.count < minPQ.count { maxPQ.push(minPQ.pop()!) }
    if minPQ.count < maxPQ.count { minPQ.push(maxPQ.pop()!) }

    answer.append("\(minPQ.heap[0])\n")
}

print(answer)
