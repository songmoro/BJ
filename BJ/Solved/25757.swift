//
//  25757.swift
//  BJ
//
//  Created by 송재훈 on 2/7/25.
//


//7 Y
//lms0806
//lms0806
//exponentiale
//lms0806
//jthis
//lms0806
//leo020630
//
//4
//
//12 F
//lms0806
//powergee
//skeep194
//lms0806
//tony9402
//lms0806
//wider93
//lms0806
//mageek2guanaah
//lms0806
//jthis
//lms0806
//
//3
//
//12 O
//lms0806
//mageek2guanaah
//jthis
//lms0806
//exponentiale
//lms0806
//leo020630
//lms0806
//powergee
//lms0806
//skeep194
//lms0806
//
//2

let games = ["Y": 1, "F": 2, "O": 3]

let playersWithGame = readLine()!.split(separator: " ").map({ String($0) })
let (players, game) = (Int(playersWithGame[0])!, games[playersWithGame[1]]!)

var played = Set<String>()
var playerCount = 0
var answer = 0

for _ in 0..<players {
    let player = readLine()!
    
    if played.insert(player).inserted {
        playerCount += 1
        
        if playerCount == game {
            answer += 1
            playerCount = 0
        }
    }
}

print(answer)
