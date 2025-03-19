//
//  18870.swift
//  BJ
//
//  Created by 송재훈 on 3/19/25.
//


//5
//2 4 -10 4 -9

let N = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let sortedNumbers = Set(numbers).sorted()
var answers = [String]()

for i in 0..<N {
    let X = numbers[i]
    var (l, r) = (0, sortedNumbers.count)
    while l < r {
        let mid = (l + r) / 2
        
        if X < sortedNumbers[mid] { r = mid }
        else { l = mid + 1 }
    }
    
    answers.append(String(l - 1))
}

print(answers.joined(separator: " "))
