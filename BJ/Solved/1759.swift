//
//  1759.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//4 6
//a t c i s w

let LC = readLine()!.split(separator: " ").map { Int(String($0))! }
let (L, C) = (LC[0], LC[1])
let char = readLine()!.split(separator: " ").map({ String($0) }).sorted()

var answer = Set<String>()

func back(_ i: Int, _ current: String) {
    if i == C {
        let aeiou = current.filter({ "aeiou".contains($0) }).count
        if current.count == L, aeiou >= 1, current.count - aeiou >= 2 {
            answer.insert(current)
        }
    }
    else {
        for j in i..<C {
            back(j + 1, current)
            back(j + 1, current + char[j])
        }
    }
}

back(0, "")
print(answer.sorted().joined(separator: "\n"))
