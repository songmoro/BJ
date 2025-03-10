//
//  9017.swift
//  BJ
//
//  Created by 송재훈 on 2/4/25.
//

//2
//15
//1 2 3 3 1 3 2 4 1 1 3 1 3 3 1
//18
//1 2 3 1 2 3 1 2 3 3 3 3 2 2 2 1 1 1
//
//1
//3

let T = Int(readLine()!)!

for _ in 0..<T {
    let _ = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let dict = Dictionary(grouping: numbers.enumerated(), by: { $0.element }).filter({ $0.value.count == 6 })
    
    var rank = 1
    var ranked = [Int]()
    
    for i in numbers {
        if dict[i] == nil {
            ranked.append(0)
        }
        else {
            ranked.append(rank)
            rank += 1
        }
    }
    
    var answer = 0
    var minScore = Int.max
    
    for (key, values) in dict {
        let score = values.dropLast(2).reduce(0) { $0 + ranked[$1.offset] }
        
        if score < minScore {
            answer = key
            minScore = score
        }
        else if score == minScore, values[4] < dict[answer]![4] {
            answer = key
            minScore = score
        }
    }
        
    print(answer)
}
