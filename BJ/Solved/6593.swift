//
//  6593.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//3 4 5
//S....
//.###.
//.##..
//###.#
//
//#####
//#####
//##.##
//##...
//
//#####
//#####
//#.###
//####E
//
//1 3 3
//S##
//#E#
//###
//
//0 0 0

let moves = [(-1, 0, 0), (1, 0, 0), (0, -1, 0), (0, 1, 0), (0, 0, -1), (0, 0, 1)]

loop:
while true {
    let LRC = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (L, R, C) = (LRC[0], LRC[1], LRC[2])
    
    if L == 0, R == 0, C == 0 { break }
    
    var building = [[[String]]]()
    var visit = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: C), count: R), count: L)
    var queue = [(Int, Int, Int, Int)]()
    var index = 0
    
    for l in 0..<L {
        building.append([])
        
        for r in 0..<R {
            let input = readLine()!.map { String($0) }
            
            for c in 0..<C {
                if input[c] == "." || input[c] == "#" || input[c] == "E" {
                    continue
                }
                queue.append((l, r, c, 0))
                visit[l][r][c] = true
            }
            
            building[l].append(input)
        }
        
        _ = readLine()!
    }
    
    while index < queue.count {
        let first = queue[index]
        index += 1
        
        for move in moves {
            let (nl, nr, nc, d) = (first.0 + move.0, first.1 + move.1, first.2 + move.2, first.3 + 1)
            
            if nl < 0 || nl >= L { continue }
            if nr < 0 || nr >= R { continue }
            if nc < 0 || nc >= C { continue }
            if building[nl][nr][nc] == "#" || visit[nl][nr][nc] { continue }
            if building[nl][nr][nc] == "E" {
                print("Escaped in \(d) minute(s).")
                continue loop
            }
            
            visit[nl][nr][nc] = true
            queue.append((nl, nr, nc, d))
        }
    }
    
    print("Trapped!")
}
