//
//  10869.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//7 3

let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
let (A, B) = (AB[0], AB[1])

print(A + B)
print(A - B)
print(A * B)
print(A / B)
print(A % B)
