//
//  2206.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//6 4
//0100
//1110
//1000
//0000
//0111
//0000

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var map = [[Bool]]()

for _ in 0..<N {
    let input = readLine()!.map { String($0) == "0" }
    map.append(input)
}

var visit = [[[Bool]]](repeating: [[Bool]](repeating: [false, false], count: M), count: N)
visit[0][0][0] = true

var queue = [(0, 0, 1, 0)]
var index = 0
var answer = -1

while index < queue.count {
    let (n, m, d, b) = queue[index]
    index += 1
    
    if n == N - 1, m == M - 1 {
        answer = d
        break
    }
    
    for move in moves {
        let (nn, nm, nd) = (n + move.0, m + move.1, d + 1)
        
        if nn < 0 || nn >= N || nm < 0 || nm >= M { continue }
        
        if map[nn][nm], !visit[nn][nm][b] {
            visit[nn][nm][b] = true
            queue.append((nn, nm, nd, b))
        }
        else if !map[nn][nm], !visit[nn][nm][1], b == 0 {
            visit[nn][nm][1] = true
            queue.append((nn, nm, nd, 1))
        }
    }
}

print(answer)
