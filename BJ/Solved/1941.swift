//
//  1941.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//YYYYY
//SYSYS
//YYYYY
//YSYYS
//YYYYY

// Y = 임도연
// S = 이다솜

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]
var board = [[Character]]()
var answer = 0

for _ in 0..<5 { board.append(Array(readLine()!)) }

func generateCombinations(_ start: Int, _ mask: Int, _ count: Int) {
    if count == 7 {
        if isValidGroup(mask) { answer += 1 }
        return
    }
    
    for i in start..<25 { generateCombinations(i + 1, mask | (1 << i), count + 1) }
}

func isValidGroup(_ mask: Int) -> Bool {
    var queue = [(Int, Int)]()
    var visited = Set<Int>()
    var dasomCount = 0
    var first = -1

    for i in 0..<25 where (mask & (1 << i)) != 0 {
        let x = i / 5, y = i % 5
        if first == -1 { first = i }
        if board[x][y] == "S" { dasomCount += 1 }
    }
    
    if dasomCount < 4 { return false }
    
    var queueIndex = 0
    queue.append((first / 5, first % 5))
    visited.insert(first)

    while queueIndex < queue.count {
        let (x, y) = queue[queueIndex]
        queueIndex += 1

        for d in 0..<4 {
            let nx = x + dx[d], ny = y + dy[d]
            let pos = nx * 5 + ny
            
            if (0...4) ~= nx, (0...4) ~= ny, (mask & (1 << pos)) != 0, !visited.contains(pos) {
                queue.append((nx, ny))
                visited.insert(pos)
                
                if visited.count == 7 {
                    return true
                }
            }
        }
    }

    return false
}

generateCombinations(0, 0, 0)
print(answer)
