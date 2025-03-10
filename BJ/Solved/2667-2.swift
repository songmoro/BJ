//
//  2667-2.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//7
//0110100
//0110101
//1110101
//0000111
//0100000
//0111110
//0111000

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let N = Int(readLine()!)!
var apartment = [[Bool]]()
var visit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

for _ in 0..<N {
    let input = readLine()!.map({ String($0) == "1" })
    apartment.append(input)
}

var apartments = [Int]()

for i in 0..<N {
    for j in 0..<N where apartment[i][j] && !visit[i][j] {
        visit[i][j] = true
        var stack = [(i, j)]
        var size = 1
        
        while !stack.isEmpty {
            let last = stack.removeLast()
            
            for move in moves {
                let n = (last.0 + move.0, last.1 + move.1)
                
                if n.0 < 0 || n.1 < 0 || n.0 >= N || n.1 >= N { continue }
                if !apartment[n.0][n.1] || visit[n.0][n.1] { continue }
                
                visit[n.0][n.1] = true
                stack.append(n)
                size += 1
            }
        }
        
        apartments.append(size)
    }
}

print(apartments.count)
for size in apartments.sorted() {
    print(size)
}
