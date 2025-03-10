//
//  2164.swift
//  BJ
//
//  Created by 송재훈 on 2/9/25.
//


//1
//1
//
//2
//12
//2
//
//3
//123
//23
//32
//2
//
//4
//1234
//234
//342
//42
//24
//4
//
//5
//12345
//2345
//3452
//452
//524
//24
//42
//2
//
//6
//123456
//23456
//34562
//4562
//5624
//624
//246
//46
//64
//4
//
//8
//12345678
//2345678
//3456782
//456782
//567824
//67824
//78246
//8246
//2468
//468
//684
//84
//48
//8

//9
//123456789
//23456789 -> 34567892
//34567892
//4567892 -> 5678924
//5678924
//678924 -> 789246
//789246
//89246 -> 92468
//92468
//2468 -> 4682
//4682
//682 -> 826
//826
//26 -> 62
//62
//2

struct Queue {
    private var queue: [Int?] = []
    private var head = 0
    
    init(N: Int) { queue += (1...N).map({ $0 }) }
    
    public var count: Int { queue.count - head }
    public mutating func enqueue(_ element: Int) { queue.append(element) }
    public mutating func dequeue() -> Int? {
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        if head > 10000 {
            queue.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

var queue = Queue(N: Int(readLine()!)!)

while queue.count != 1 {
    let (_, first) = (queue.dequeue(), queue.dequeue())
    if let first = first { queue.enqueue(first) }
}

print(queue.dequeue()!)


// ->

//let n = Int(readLine()!)!
//var arr = Array(1...n)
//var head = 0
//
//while head < arr.count - 1 {
//    head += 1  // 첫 번째 카드를 버림
//    arr.append(arr[head])  // 두 번째 카드를 뒤로 이동
//    head += 1  // 두 번째 카드도 제거
//}
//
//print(arr[head])
