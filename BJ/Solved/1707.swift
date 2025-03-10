//
//  1707.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//2
//3 2
//1 3
//2 3
//4 4
//1 2
//2 3
//3 4
//4 2

var T = Int(readLine()!)!

loop:
while T != 0 {
    T -= 1
    
    let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (N, M) = (NM[0], NM[1])
    var graph = [[Int]](repeating: [], count: N + 1)
    
    for _ in 0..<M {
        let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (u, v) = (uv[0], uv[1])
        
        graph[u].append(v)
        graph[v].append(u)
    }
    
    var color = [Int](repeating: -1, count: N + 1)
    
    func bfs(_ i: Int) -> Bool {
        var queue = [i]
        var index = 0
        color[i] = 0
        
        while index < queue.count {
            let first = queue[index]
            index += 1
            
            for i in graph[first] {
                if color[i] == -1 {
                    queue.append(i)
                    color[i] = 1 - color[first]
                }
                else if color[i] == color[first] {
                    return false
                }
            }
        }
        
        return true
    }
    
    for i in 1...N where color[i] == -1 {
        if !bfs(i) {
            print("NO")
            continue loop
        }
    }
    
    print("YES")
}
