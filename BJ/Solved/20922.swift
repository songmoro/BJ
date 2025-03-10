//
//  20922.swift
//  BJ
//
//  Created by 송재훈 on 2/9/25.
//


//9 2
//3 2 5 5 6 4 4 5 7

let NK = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, K) = (NK[0], NK[1])
let array = readLine()!.split(separator: " ").map({ Int($0)! })

var dict = Dictionary<Int, Int>()
var answer = 0

var (left, right) = (0, 0)

while right < N {
    dict[array[right], default: 0] += 1
    
    while dict[array[right]]! > K {
        dict[array[left]]! -= 1
        left += 1
    }
    
    answer = max(answer, right - left + 1)
    right += 1
}

print(answer)

//right++
//3
//3 2
//3 2 5
//3 2 5 5
//3 2 5 5 6
//3 2 5 5 6 4
//3 2 5 5 6 4 4
//3 2 5 5 6 4 4 5
//
//left++
//2 5 5 6 4 4 5
//5 5 6 4 4 5
//5 6 4 4 5
//
//right++
//5 6 4 4 5 7
