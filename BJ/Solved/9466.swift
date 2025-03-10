//
//  9466.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//2
//7
//3 1 3 7 3 4 6
//8
//1 2 3 4 5 6 7 8

var T = Int(readLine()!)!

while T != 0 {
    T -= 1
    let n = Int(readLine()!)!
    
    let students = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
    var visit = [Int](repeating: -1, count: n)
    var answer = n
    
    for i in 0..<n where visit[i] == -1 {
        var cycle = [Int]()
        var current = students[i]
        
        while visit[current] == -1 {
            visit[current] = 0
            cycle.append(current)
            current = students[current]
        }
        
        if let first = cycle.firstIndex(of: current) {
            answer -= cycle.count - Int(first)
        }
    }
    
    print(answer)
}
