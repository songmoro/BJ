//
//  1920-2.swift
//  BJ
//
//  Created by 송재훈 on 3/19/25.
//


//5
//4 1 5 2 3
//5
//1 3 7 9 5

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()
let M = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

loop:
for i in 0..<M {
    let X = numbers[i]
    var (left, right) = (0, N - 1)
    
    while left <= right {
        let mid = (left + right) / 2
        
        if X == A[mid] {
            print(1)
            continue loop
        }
        else if X < A[mid] { right = mid - 1 }
        else { left = mid + 1 }
    }
    
    print(0)
}
