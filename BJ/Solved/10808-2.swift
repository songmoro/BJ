//
//  10808-2.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//baekjoon

let alphabet = Dictionary(uniqueKeysWithValues: zip("abcdefghijklmnopqrstuvwxyz", 0...25))
var wordCount = [Int](repeating: 0, count: 26)

_ = readLine()!.forEach { wordCount[alphabet[$0]!] += 1 }
print(wordCount.map({ String($0) }).joined(separator: " "))
