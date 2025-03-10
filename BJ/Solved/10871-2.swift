//
//  10871-2.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//10 5
//1 10 4 9 2 3 8 5 7 6

let NX = readLine()!.split(separator: " ").map { Int(String($0))! }
let X = NX[1]
let A = readLine()!.split(separator: " ").map { Int(String($0))! }

print(A.filter({ $0 < X }).map({ String($0) }).joined(separator: " "))
