//
//  21921.swift
//  BJ
//
//  Created by 송재훈 on 2/5/25.
//

let NX = readLine()!.split(separator: " ").map({ Int(String($0))! })
let visits = readLine()!.split(separator: " ").map({ Int(String($0))! })

var maxTotalVisit = visits[0..<NX[1]].reduce(0, +)
var totalVisit = maxTotalVisit
var continuous = 1

for i in NX[1]..<NX[0] {
    totalVisit += visits[i] - visits[i - NX[1]]
    
    if totalVisit > maxTotalVisit {
        maxTotalVisit = totalVisit
        continuous = 1
    }
    else if totalVisit == maxTotalVisit {
        continuous += 1
    }
}

if maxTotalVisit == 0 {
    print("SAD")
}
else {
    print(maxTotalVisit)
    print(continuous)
}

//5 2
//1 4 2 5 1

//7
//1

// 1 4 -> 5
// 4 2 -> 6
// 2 5 -> 7
// 5 1 -> 6
