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
let characters = readLine()!.split(separator: " ").map({ String($0) }).sorted()
let vowels = Set(["a", "e", "i", "o", "u"])

var result = [String]()

func backtrack(_ index: Int, _ current: [String], _ vowelCount: Int, _ consonantCount: Int) {
    if current.count == L {
        if vowelCount >= 1 && consonantCount >= 2 { result.append(current.joined()) }
        return
    }
    
    for i in index..<C {
        let char = characters[i]
        let isVowel = vowels.contains(char)
        backtrack(i + 1, current + [char], vowelCount + (isVowel ? 1 : 0), consonantCount + (isVowel ? 0 : 1))
    }
}

backtrack(0, [], 0, 0)
print(result.joined(separator: "\n"))
