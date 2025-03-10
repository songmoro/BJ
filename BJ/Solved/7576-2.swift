//
//  7576-2.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//6 4
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1

let MN = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N) = (MN[0], MN[1])

var box = [[Int]]()
var tomatoes = [(Int, Int)]()
var seeds = [(Int, Int)]()
var days = [[Int]](repeating: [Int](repeating: -1, count: M), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    box.append(input)
    
    for j in 0..<M {
        if input[j] == 0 {
            seeds.append((i, j))
        }
        else if input[j] == 1 {
            tomatoes.append((i, j))
            days[i][j] = 0
        }
    }
}

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var queue = tomatoes
var index = 0
var remains = seeds.count

while index < queue.count {
    let first = queue[index]
    index += 1
    
    for move in moves {
        let n = (first.0 + move.0, first.1 + move.1)
        
        if n.0 >= 0, n.1 >= 0, n.0 < N, n.1 < M, box[n.0][n.1] == 0 {
            if days[n.0][n.1] == -1 || days[n.0][n.1] > days[first.0][first.1] + 1 {
                queue.append(n)
                days[n.0][n.1] = days[first.0][first.1] + 1
            }
        }
    }
    
    if remains == 0 { break }
}

var maxDay = days.max(by: { $0.max()! < $1.max()! })!.max()!

for seed in seeds {
    let day = days[seed.0][seed.1]
    
    if day == -1 {
        maxDay = -1
        break
    }
}

print(maxDay)
