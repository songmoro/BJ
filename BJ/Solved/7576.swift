//
//  7576.swift
//  BJ
//
//  Created by 송재훈 on 2/15/25.
//


//6 4
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1

let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let MN = readLine()!.split(separator: " ").map({ Int($0)! })
let (M, N) = (MN[0], MN[1])

var boxes = [[Int]]()
var nils = 0
var tomatoes = [(Int, Int)]()
var days = 0

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    
    nils += input.filter({ $0 == 0 }).count
    
    input.enumerated()
        .filter({ $0.element == 1 })
        .forEach {
            tomatoes.append((i, $0.offset))
        }
    
    boxes.append(input)
}

while !tomatoes.isEmpty, nils != 0 {
    var nextTomatoes = [(Int, Int)]()
    days += 1
    
    for tomato in tomatoes {
        for dir in dirs {
            let d = (tomato.0 + dir.0, tomato.1 + dir.1)
            
            if d.0 >= 0, d.1 >= 0, d.0 < N, d.1 < M, boxes[d.0][d.1] == 0 {
                boxes[d.0][d.1] = 1
                nils -= 1
                nextTomatoes.append(d)
            }
        }
    }
    
    if nils == 0 { break }
    tomatoes = nextTomatoes
}

if nils == 0 { print(days) }
else { print(-1) }
