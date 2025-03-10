//
//  5427.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//5
//4 3
//####
//#*@.
//####
//7 6
//###.###
//#*#.#*#
//#.....#
//#.....#
//#..@..#
//#######
//7 4
//###.###
//#....*#
//#@....#
//.######
//5 5
//.....
//.***.
//.*@*.
//.***.
//.....
//3 3
//###
//#@#
//###

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var T = Int(readLine()!)!

loop:
while T != 0 {
    T -= 1
    
    let wh = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (w, h) = (wh[0], wh[1])
    
    var building = [[String]]()
    var distance = [[Int]](repeating: [Int](repeating: -1, count: w), count: h)
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
    var fire = [(Int, Int)]()
    var fireIndex = 0
    var sangeun = [(Int, Int, Int)]()
    var sangeunIndex = 0
    
    for i in 0..<h {
        let input = readLine()!.map { String($0) }
        
        for j in 0..<w {
            if input[j] == "*" {
                fire.append((i, j))
                distance[i][j] = 0
            }
            else if input[j] == "@" {
                sangeun = [(i, j, 0)]
                visit[i][j] = true
            }
        }
        
        building.append(input)
    }
    
    while fireIndex < fire.count {
        let first = fire[fireIndex]
        fireIndex += 1
        
        for move in moves {
            let n = (first.0 + move.0, first.1 + move.1)
            
            if n.0 < 0 || n.0 >= h || n.1 < 0 || n.1 >= w {
                continue
            }
            if building[n.0][n.1] == "#" || distance[n.0][n.1] != -1 {
                continue
            }
            
            distance[n.0][n.1] = distance[first.0][first.1] + 1
            fire.append(n)
        }
    }
    
    while sangeunIndex < sangeun.count {
        let first = sangeun[sangeunIndex]
        sangeunIndex += 1
        
        for move in moves {
            let n = (first.0 + move.0, first.1 + move.1, first.2 + 1)
            
            if n.0 < 0 || n.0 >= h || n.1 < 0 || n.1 >= w {
                print(n.2)
                continue loop
            }
            if building[n.0][n.1] != "." || visit[n.0][n.1] {
                continue
            }
            if (distance[n.0][n.1] != -1) && (distance[n.0][n.1] <= n.2) {
                continue
            }
            
            visit[n.0][n.1] = true
            sangeun.append(n)
        }
    }
    
    print("IMPOSSIBLE")
}
