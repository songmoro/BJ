//
//  2573.swift
//  BJ
//
//  Created by 송재훈 on 2/1/25.
//


//5 7
//0 0 0 0 0 0 0
//0 2 4 5 3 0 0
//0 3 0 2 5 2 0
//0 7 6 2 4 0 0
//0 0 0 0 0 0 0

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }

var arctic = [[Int]]()
var ice = 0

for _ in 0..<NM[0] {
    let partialArctic = readLine()!.split(separator: " ").map({ Int(String($0))! })
    arctic.append(partialArctic)
    ice += partialArctic.filter({ $0 != 0 }).count
}

let direction: [(x: Int, y: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var answer = 0

while ice != 0 {
    var partialArctic = arctic
    var partialIce = ice
    answer += 1
    
    for i in 0..<NM[0] {
        for j in 0..<NM[1] where arctic[i][j] != 0 {
            for d in direction {
                let n = (x: i + d.x, y: j + d.y)
                
                if n.x < 0 || n.y < 0 || n.x >= NM[0] || n.y >= NM[1] {
                    continue
                }
                
                if arctic[n.x][n.y] == 0, partialArctic[i][j] != 0 {
                    partialArctic[i][j] -= 1
                    partialIce += (partialArctic[i][j] == 0 ? 1 : 0)
                }
            }
        }
    }
    
    if partialIce != ice {
        var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: NM[1]), count: NM[0])
        var count = 0
        
        for i in 0..<NM[0] {
            for j in 0..<NM[1] where partialArctic[i][j] != 0 && !visited[i][j] {
                var stack = [(i, j)]
                visited[i][j] = true
                count += 1
                
                while let last = stack.popLast() {
                    for d in direction {
                        let n = (x: last.0 + d.x, y: last.1 + d.y)
                        
                        if n.x < 0 || n.y < 0 || n.x >= NM[0] || n.y >= NM[1] {
                            continue
                        }
                        
                        if partialArctic[n.x][n.y] != 0, !visited[n.x][n.y] {
                            visited[n.x][n.y] = true
                            stack.append((n.x, n.y))
                        }
                    }
                }
            }
        }
        
        if count == 0 {
            answer = 0
            break
        }
        else if count != 1 {
            break
        }
    }
    
    arctic = partialArctic
}

print(answer)
