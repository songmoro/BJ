//
//  14940.swift
//  BJ
//
//  Created by 송재훈 on 1/21/25.
//


//15 15
//2 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 0 0 0 0 1
//1 1 1 1 1 1 1 1 1 1 0 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 0 1 0 0 0
//1 1 1 1 1 1 1 1 1 1 0 1 1 1 1

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }

func oob(_ i: Int, _ j: Int) -> Bool {
    i < 0 || j < 0 || i >= nm[0] || j >= nm[1]
}

var queue: [(Int, Int)] = []
var start = (0, 0)
let (dx, dy) = ([-1, 1, 0, 0], [0, 0, -1, 1])

let maps: [[Int]] = (0..<nm[0]).map { i in
    let map = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if map.contains(2) {
        let j = map.firstIndex(of: 2)!
        start = (i, j)
        queue.append((i, j))
    }
    
    return map
}

var results: [[Int]] = .init(repeating: .init(repeating: -1, count: nm[1]), count: nm[0])
results[start.0][start.1] = 0

while !queue.isEmpty {
    let last = queue.removeFirst()
    
    for d in 0...3 {
        let (nx, ny) = (last.0 + dx[d], last.1 + dy[d])
        
        if oob(nx, ny) || maps[nx][ny] == 0 || results[nx][ny] != -1 {
            continue
        }
        
        results[nx][ny] = results[last.0][last.1] + 1
        queue.append((nx, ny))
    }
}

var answer = ""

for i in 0..<nm[0] {
    for j in 0..<nm[1] where maps[i][j] == 0 {
        results[i][j] = 0
    }
    
    answer.append(results[i].map({ String($0) }).joined(separator: " "))
    answer.append("\n")
}

print(answer.dropLast())




//15 15
//2 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 0 0 0 0 1
//1 1 1 1 1 1 1 1 1 1 0 1 1 1 1
//1 1 1 1 1 1 1 1 1 1 0 1 0 0 0
//1 1 1 1 1 1 1 1 1 1 0 1 1 1 1

let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var start = (0, 0)

var maps: [[Int]] = (0..<N).map { i in
    let map = readLine()!.split(separator: " ").map({ Int($0)! })
    if let j = map.firstIndex(of: 2) { start = (i, j) }
    
    return map
}

var distances: [[Int]] = .init(repeating: .init(repeating: -1, count: M), count: N)
var queue = [start]

distances[start.0][start.1] = 0

for i in 0..<N {
    for j in 0..<M where maps[i][j] == 0 {
        distances[i][j] = 0
    }
}

while !queue.isEmpty {
    let first = queue.removeFirst()
    
    for d in directions {
        let n = (d.0 + first.0, d.1 + first.1)
        
        if n.0 >= 0, n.1 >= 0, n.0 < N, n.1 < M {
            if maps[n.0][n.1] == 1, distances[n.0][n.1] == -1 {
                distances[n.0][n.1] = distances[first.0][first.1] + 1
                queue.append(n)
            }
        }
    }
}

var answer = ""

for distance in distances {
    answer += distance.map({ String($0) }).joined(separator: " ")
    answer += "\n"
}

print(answer.dropLast())
