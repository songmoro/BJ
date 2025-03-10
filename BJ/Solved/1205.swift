//
//  1205.swift
//  BJ
//
//  Created by 송재훈 on 2/7/25.
//


//3 90 10
//100 90 80
//2

//10 1 10
//10 9 8 7 6 5 4 3 2 1
//-1

//10 1 10
//10 9 8 7 6 5 4 3 3 0
//10

let NScoreP = readLine()!.split(separator: " ").map({ Int(String($0))! })
var ranked = [Int]()

if NScoreP[0] != 0 {
    ranked = readLine()!.split(separator: " ").map({ Int(String($0))! })
}

var answer = 0

if ranked.count == 0 {
    answer = 1
}
else if ranked.last! >= NScoreP[1], NScoreP[2] == ranked.count {
    answer = -1
}
else {
    var partialAnswer = ranked.count
    
    for rank in ranked.enumerated().reversed() {
        partialAnswer = rank.offset + 1
        
        if rank.element > NScoreP[1] {
            partialAnswer += 1
            break
        }
    }
    
    answer = partialAnswer
}

print(answer)

//5 30 10
//100 90 80 70 60
//6
//
//3 90 10
//100 100 90
//3
//
//3 101 10
//100 100 90
//1
//
//5 5 10
//10 9 8 7 6
//6
//
//6 75 10
//100 90 85 80 70 60
//5

//5 60 5
//100 90 80 70 60
//-1
//
//10 20 10
//100 90 80 70 60 50 50 40 30 20
//-1
//
//10 50 10
//100 90 80 70 60 50 50 40 30 20
//6
//
//10 20 10
//100 90 80 70 60 50 50 20 20 20
//-1
//
//3 100 3
//100 100 100
//-1
//
//10 5 10
//100 90 80 70 60 50 40 30 20 10
//-1

//5 110 10
//100 90 80 70 60
//1
//
//5 91 10
//100 90 80 70 60
//2
//
//10 21 10
//100 90 80 70 60 50 50 40 30 20
//10
//
//10 30 10
//100 90 80 70 60 50 50 40 30 20
//9
