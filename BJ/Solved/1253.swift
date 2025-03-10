//
//  1253.swift
//  BJ
//
//  Created by 송재훈 on 2/3/25.
//


//
//10
//1 2 3 4 5 6 7 8 9 10

//8

let N = Int(readLine()!)!
let numbers: [Int] = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()

var answer = 0

if numbers.count >= 3 {
    for i in 0..<N {
        var (left, right) = (0, N - 1)
        
    loop:
        while left < right {
            switch i {
            case left:
                left += 1
                continue loop
            case right:
                right -= 1
                continue loop
            default:
                break
            }
            
            let sum = numbers[left] + numbers[right]
            
            switch sum {
            case numbers[i]:
                answer += 1
                break loop
            case ..<numbers[i]:
                left += 1
            case numbers[i]...:
                right -= 1
            default:
                break
            }
        }
    }
}

print(answer)
