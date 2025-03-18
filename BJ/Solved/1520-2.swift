//
//  1520-2.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//4 5
//50 45 37 32 30
//35 50 40 20 25
//30 30 25 17 28
//27 24 22 15 10

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
var map = [[Int]]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(input)
}

var dp = [[Int]](repeating: [Int](repeating: -1, count: M + 1), count: N + 1)
let (dx, dy) = ([-1, 1, 0, 0], [0, 0, -1, 1])

func dfs(_ x: Int, _ y: Int) -> Int {
    if dp[x][y] != -1 { return dp[x][y] }
    if (x, y) == (N - 1, M - 1) { return 1 }
    dp[x][y] = 0
    
    for i in 0..<4 {
        let (nx, ny) = (x + dx[i], y + dy[i])
        
        if nx >= 0, ny >= 0, nx < N, ny < M, map[nx][ny] < map[x][y] {
            dp[x][y] += dfs(nx, ny)
        }
    }
    
    return dp[x][y]
}

print(dfs(0, 0))
