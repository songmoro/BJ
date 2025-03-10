//
//  1325-2.swift
//  BJ
//
//  Created by 송재훈 on 3/8/25.
//


//5 4
//3 1
//3 2
//4 3
//5 3

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
var graph = [Set<Int>](repeating: [], count: N + 1)

for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (uv[0], uv[1])
    
    graph[v].insert(u)
}

var answer = (0, [Int]())

func dfs(_ i: Int) -> Int {
    var stack = [i]
    var index = 0
    var count = 1
    var visit = [Bool](repeating: false, count: N + 1)
    visit[i] = true
    
    while index < stack.count {
        let last = stack[index]
        index += 1
        
        for j in graph[last] where !visit[j] {
            stack.append(j)
            visit[j] = true
            count += 1
        }
    }
    
    return count
}

for i in 1...N {
    let count = dfs(i)
    
    if answer.0 < count { answer = (count, [i]) }
    else if answer.0 == count { answer.1.append(i) }
}

print(answer.1.map({ String($0) }).joined(separator: " "))
