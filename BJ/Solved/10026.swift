//
//  10026.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//5
//RRRBB
//GGBBB
//BBBRR
//BBRRR
//RRRRR

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let N = Int(readLine()!)!
var paint = [[String]]()

for _ in 0..<N {
    let input = readLine()!.map { String($0) }
    paint.append(input)
}

var visit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
var visitWeak = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

var sector = 0
var sectorWeak = 0

for i in 0..<N {
    for j in 0..<N {
        if !visit[i][j] {
            visit[i][j] = true
            sector += 1
            var stack = [(i, j)]
            let color = paint[i][j]
            
            while !stack.isEmpty {
                let last = stack.removeLast()
                
                for move in moves {
                    let n = (last.0 + move.0, last.1 + move.1)
                    
                    if n.0 >= 0, n.1 >= 0, n.0 < N, n.1 < N, paint[n.0][n.1] == color, !visit[n.0][n.1] {
                        visit[n.0][n.1] = true
                        stack.append(n)
                    }
                }
            }
        }
        
        if !visitWeak[i][j] {
            visitWeak[i][j] = true
            sectorWeak += 1
            var stack = [(i, j)]
            let color = paint[i][j]
            
            while !stack.isEmpty {
                let last = stack.removeLast()
                
                for move in moves {
                    let n = (last.0 + move.0, last.1 + move.1)
                    
                    if n.0 >= 0, n.1 >= 0, n.0 < N, n.1 < N, !visitWeak[n.0][n.1] {
                        if color == paint[n.0][n.1] {
                            visitWeak[n.0][n.1] = true
                            stack.append(n)
                        }
                        else if (color == "R" || color == "G"), (paint[n.0][n.1] == "R" || paint[n.0][n.1] == "G") {
                            visitWeak[n.0][n.1] = true
                            stack.append(n)
                        }
                    }
                }
            }
        }
    }
}

print(sector, sectorWeak)
