//
//  1389-2.swift
//  BJ
//
//  Created by 송재훈 on 3/8/25.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

// 1. 그래프 생성
var graph = [[Int]](repeating: [], count: N + 1)

for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let (A, B) = (edge[0], edge[1])
    graph[A].append(B)
    graph[B].append(A)
}

// 2. BFS를 이용해 최단 거리 탐색
func bfs(_ start: Int) -> Int {
    var queue = [start]
    var visited = [Int](repeating: -1, count: N + 1) // 방문 여부 및 거리 저장
    visited[start] = 0
    var index = 0
    var totalDistance = 0
    
    while index < queue.count {
        let current = queue[index]
        index += 1
        
        for next in graph[current] {
            if visited[next] == -1 {  // 아직 방문하지 않은 노드
                visited[next] = visited[current] + 1
                totalDistance += visited[next]  // 거리 누적
                queue.append(next)
            }
        }
    }
    
    return totalDistance
}

// 3. 모든 유저의 케빈 베이컨 수 계산
var minDistance = Int.max
var resultUser = -1

for user in 1...N {
    let distance = bfs(user)
    if distance < minDistance {
        minDistance = distance
        resultUser = user
    }
}

print(resultUser)
