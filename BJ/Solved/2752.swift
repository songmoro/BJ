//
//  2752.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//3 1 2

let triple = readLine()!.split(separator: " ").map { Int(String($0))! }
print(triple.sorted().map({ String($0) }).joined(separator: " "))
