//
//  1920.swift
//  BJ
//
//  Created by 송재훈 on 2/9/25.
//


//5
//4 1 5 2 3
//5
//1 3 7 9 5

let N = Int(readLine()!)!
let A = Set(readLine()!.split(separator: " ").map({ Int($0)! }))
let M = Int(readLine()!)!
let B = readLine()!.split(separator: " ").map({ Int($0)! })

for b in B {
    print(A.contains(b) ? 1 : 0)
}