//
//  PriorityQueue.swift
//  BJ
//
//  Created by 송재훈 on 3/20/25.
//

struct PriorityQueue<T: Comparable> {
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
