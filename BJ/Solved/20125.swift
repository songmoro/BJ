//
//  20125.swift
//  BJ
//
//  Created by 송재훈 on 2/4/25.
//


//5
//_____
//__*__
//_***_
//__*__
//_*_*_

let N = Int(readLine()!)!
var boards: [[Bool]] = .init()

for _ in 0..<N {
    boards.append(readLine()!.map({ $0 == "*" }))
}

var hearts = (0, 0)

findHearts:
for i in 0..<N {
    for j in 0..<N where boards[i][j] {
        hearts = (i + 1, j)
        break findHearts
    }
}

let leftArm = boards[hearts.0][0..<hearts.1].filter({ $0 }).count
let rightArm = boards[hearts.0][(hearts.1 + 1)..<N].filter({ $0 }).count
let waist = ((hearts.0 + 1)..<N).map({ boards[$0][hearts.1] }).filter({ $0 }).count
let leftLeg = ((hearts.0 + 1)..<N).map({ boards[$0][hearts.1 - 1] }).filter({ $0 }).count
let rightLeg = ((hearts.0 + 1)..<N).map({ boards[$0][hearts.1 + 1] }).filter({ $0 }).count

print(hearts.0 + 1, hearts.1 + 1)
print(leftArm, rightArm, waist, leftLeg, rightLeg)
