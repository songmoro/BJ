//
//  3151.swift
//  BJ
//
//  Created by 송재훈 on 4/4/25.
//

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()

var answer = 0

if N >= 3 {
    for i in 0..<(N - 2) {
        var (left, right) = (i + 1, N - 1)
        
        while left < right {
            let total = A[i] + A[left] + A[right]
            
            if total == 0 {
                if A[left] == A[right] {
                    answer += (right - left) * (right - left + 1) / 2
                    break
                }
                
                var (leftCount, rightCount) = (1, 1)
                
                while left + 1 < right, A[left] == A[left + 1] {
                    left += 1
                    leftCount += 1
                }
                while right - 1 > left, A[right] == A[right - 1] {
                    right -= 1
                    rightCount += 1
                }
                
                answer += leftCount * rightCount
                
                left += 1
                right -= 1
            }
            else if total < 0 { left += 1 }
            else { right -= 1 }
        }
    }
}

print(answer)
