//
//  PriorityQueue.swift
//  BJ
//
//  Created by 송재훈 on 3/20/25.
//


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