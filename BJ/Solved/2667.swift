//
//  2667.swift
//  BJ
//
//  Created by 송재훈 on 1/31/25.
//


//7
//0110100
//0110101
//1110101
//0000111
//0100000
//0111110
//0111000

//3
//7
//8
//9

let N = Int(readLine()!)!
var maps = [[Bool]]()

for _ in 0..<N {
    maps.append(readLine()!.map({ Bool($0 == "1") }))
}

var visit: [[Bool]] = .init(repeating: .init(repeating: false, count: N), count: N)
var (count, number): (Int, [Int]) = (0, [])

func oob(_ i: Int, _ j: Int) -> Bool {
    i < 0 || j < 0 || i >= N || j >= N
}

let d = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for i in 0..<N {
    for j in 0..<N where maps[i][j] && !visit[i][j] {
        var queue = [(i, j)]
        count += 1
        var partialNumber = 1
        visit[i][j] = true
        
        while let last = queue.popLast() {
            
            for (dx, dy) in d {
                let (nx, ny) = (last.0 + dx, last.1 + dy)
                
                if oob(nx, ny) || visit[nx][ny] || !maps[nx][ny] {
                    continue
                }
                else {
                    visit[nx][ny] = true
                    queue.append((nx, ny))
                    partialNumber += 1
                }
            }
        }
        
        number.append(partialNumber)
    }
}

print(count)
for n in number.sorted(by: <) {
    print(n)
}
