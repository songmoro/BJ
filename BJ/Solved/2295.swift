//
//  2295.swift
//  BJ
//
//  Created by 송재훈 on 3/19/25.
//


//5
//2
//3
//5
//10
//18

let N = Int(readLine()!)!
var numbers = [Int]()
var twoSum = Set<Int>()
for _ in 0..<N { numbers.append(Int(readLine()!)!) }
numbers.sort()
var maxD = numbers[0] * 3

for i in 0..<N {
    for j in i..<N {
        twoSum.insert(numbers[i] + numbers[j])
    }
}

for i in stride(from: N - 1, through: 0, by: -1) {
    for j in 0..<i {
        let diff = numbers[i] - numbers[j]
        
        if twoSum.contains(diff) { maxD = max(maxD, numbers[i]) }
    }
}

print(maxD)
