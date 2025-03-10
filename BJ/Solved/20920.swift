//
//  20920.swift
//  BJ
//
//  Created by 송재훈 on 1/20/25.
//



//7 4
//apple
//ant
//sand
//apple
//append
//sand
//sand

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
var dict = [String: Int]()

for _ in 0..<NM[0] {
    let read = readLine()!
    
    if read.count < NM[1] { continue }
    dict[read, default: 0] += 1
}

let sortedWords = dict
    .sorted { ($0.value, $0.key.count, $1.key) > ($1.value, $1.key.count, $0.key) }
    .map { $0.key }

sortedWords.forEach { print($0)}
