//
//  Medal.swift
//  BJ
//
//  Created by 송재훈 on 1/20/25.
//



//4 3
//1 1 2 0
//2 0 1 0
//3 0 1 0
//4 0 0 1
// -> 2

struct Medal: Hashable, Comparable {
    static func < (lhs: Medal, rhs: Medal) -> Bool {
        (lhs.gold, lhs.silver, lhs.bronze) < (rhs.gold, rhs.silver, rhs.bronze)
    }
    
    let gold: Int
    let silver: Int
    let bronze: Int
}

let read = readLine()!.split(separator: " ").map { Int(String($0))! }
var medals = [Int: Medal]()
var ranks = [Medal: Int]()

for _ in 0..<read[0] {
    let read = readLine()!.split(separator: " ").map { Int(String($0))! }
    let medal = Medal(gold: read[1], silver: read[2], bronze: read[3])
    
    medals[read[0]] = medal
    ranks[medal, default: 0] += 1
}

var answer = 1

for rank in ranks.sorted(by: { $0 > $1 }) {
    if rank.key == medals[read[1]]! {
        print(answer)
        break
    }
    
    answer += rank.value
}
