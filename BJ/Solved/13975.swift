//
//  13975.swift
//  BJ
//
//  Created by 송재훈 on 5/8/25.
//


//2
//4
//40 30 30 50
//15
//1 21 3 4 5 35 5 4 3 5 98 21 14 17 32

struct PQ<T> {
    var heap = [T]()
    var compare: (T, T) -> Bool
    var count: Int { heap.count }
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
        if heap.count == 1 { return heap.removeLast() }
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

let T = Int(readLine()!)!

for _ in 0..<T {
    let _ = Int(readLine()!)!
    var pq = PQ<Int> { $0 < $1 }
    var answer = 0
    let disks = readLine()!.split(separator: " ").map { Int(String($0))! }
    for disk in disks { pq.push(disk) }
    while pq.count != 1 {
        let current = pq.pop()! + pq.pop()!
        answer += current
        pq.push(current)
    }
    
    print(answer)
}
