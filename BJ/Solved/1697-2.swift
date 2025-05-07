//
//  1697-2.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
//


//5 17

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]
let K = NK[1]

var visited = [Int](repeating: Int.max, count: (max(N, K) + 1) * 2)
visited[N] = 0

var queue = [N]
var i = 0

while i < queue.count {
    let x = queue[i]
    i += 1
    
    if x == K {
        print(visited[K])
        break
    }
    
    if x * 2 < (max(N, K) + 1) * 2, visited[x * 2] > visited[x] + 1 {
        queue.append(x * 2)
        visited[x * 2] = visited[x] + 1
    }
    if x - 1 >= 0, visited[x - 1] > visited[x] + 1 {
        queue.append(x - 1)
        visited[x - 1] = visited[x] + 1
    }
    if x + 1 < (max(N, K) + 1) * 2, visited[x + 1] > visited[x] + 1 {
        queue.append(x + 1)
        visited[x + 1] = visited[x] + 1
    }
}
