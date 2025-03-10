//
//  2660-2.swift
//  BJ
//
//  Created by 송재훈 on 3/8/25.
//


//5
//1 2
//2 3
//3 4
//4 5
//2 4
//5 3
//-1 -1

let N = Int(readLine()!)!
var graph = [Set<Int>](repeating: [], count: N)

while true {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (uv[0], uv[1])
    
    if u == -1, v == -1 { break }
    graph[u - 1].insert(v - 1)
    graph[v - 1].insert(u - 1)
}

var answer = (Int.max, [String]())

for i in 0..<N {
    var queue = [i]
    var visit = [Int](repeating: 0, count: N)
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        
        for j in graph[first] where visit[j] == 0 && j != i {
            queue.append(j)
            visit[j] = visit[first] + 1
        }
    }
    
    let maxScore = visit.max()!
    if answer.0 > maxScore { answer = (maxScore, ["\(i + 1)"]) }
    else if answer.0 == maxScore { answer.1.append("\(i + 1)") }
}

print(answer.0, answer.1.count)
print(answer.1.joined(separator: " "))
