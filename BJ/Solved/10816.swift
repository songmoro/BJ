//
//  10816.swift
//  BJ
//
//  Created by 송재훈 on 3/19/25.
//


//10
//6 3 2 10 10 10 -10 -10 7 3
//8
//10 9 -5 2 3 4 5 -10

// MARK: right = count vs. count - 1
// right = count를 사용하면 left가 최종적으로 정답이 됨.
// right = count - 1를 사용하면 while left <= right 형태로 구현해야 함.
// MARK: left = mid vs. mid + 1
// left = mid는 될 수 있는 경우.
// left = mid + 1은 mid가 정답이 될 수 없는 경우
// MARK: right = mid vs. mid - 1
// right = mid는 mid가 정답이 될 수 있는 경우
// right = mid - 1은 정답이 될 수 없는 경우.

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()
let M = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var answers = [String]()

for i in 0..<M {
    var (lower, upper) = (0, 0)
    let X = numbers[i]
    
    var (left, right) = (0, N)
    while left < right {
        let mid = (left + right) / 2
        
        if X <= A[mid] { right = mid }
        else { left = mid + 1 }
    }
    lower = left
    
    (left, right) = (0, N)
    while left < right {
        let mid = (left + right) / 2
        
        if X < A[mid] { right = mid }
        else { left = mid + 1 }
    }
    upper = left
    
    answers.append(String(upper - lower))
}

print(answers.joined(separator: " "))
