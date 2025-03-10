//
//  1181.swift
//  BJ
//
//  Created by 송재훈 on 2/24/25.
//


//13
//but
//i
//wont
//hesitate
//no
//more
//no
//more
//it
//cannot
//wait
//im
//yours

//i
//im
//it
//no
//but
//more
//wait
//wont
//yours
//cannot
//hesitate

let N = Int(readLine()!)!
var words = Set<String>()

for _ in 0..<N { words.insert(readLine()!) }

print(words.sorted(by: { ($0.count, $0) < ($1.count, $1) }).joined(separator: "\n"))
