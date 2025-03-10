//
//  7569.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//5 3 2
//0 0 0 0 0
//0 0 0 0 0
//0 0 0 0 0
//0 0 0 0 0
//0 0 1 0 0
//0 0 0 0 0

let moves = [(1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)]

let MNH = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N, H) = (MNH[0], MNH[1], MNH[2])

var boxes = [[[Int]]]()
var visit: [[[Bool]]] = .init(repeating: .init(repeating: .init(repeating: false, count: M), count: N), count: H)
var (index, queue) = (0, [(Int, Int, Int, Int)]())

for h in 0..<H {
    boxes.append([])
    
    for i in 0..<N {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        for j in 0..<M where input[j] == 1 {
            queue.append((h, i, j, 0))
        }
        
        boxes[h].append(input)
    }
}

var days = 0

while index < queue.count {
    let first = queue[index]
    index += 1
    
    days = max(days, first.3)
    
    for move in moves {
        let n = (first.0 + move.0, first.1 + move.1, first.2 + move.2)
        
        if n.0 < 0 || n.0 >= H { continue }
        if n.1 < 0 || n.1 >= N { continue }
        if n.2 < 0 || n.2 >= M { continue }
        if boxes[n.0][n.1][n.2] != 0 || visit[n.0][n.1][n.2] { continue }
        
        boxes[n.0][n.1][n.2] = 1
        visit[n.0][n.1][n.2] = true
        queue.append((n.0, n.1, n.2, first.3 + 1))
    }
}

var isAllGrowth = true

loop:
for h in 0..<H {
    for i in 0..<N {
        for j in 0..<M where boxes[h][i][j] == 0 {
            isAllGrowth = false
            break loop
        }
    }
}

print(isAllGrowth ? days : -1)
