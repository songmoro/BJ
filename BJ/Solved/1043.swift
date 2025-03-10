//
//  1043.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//4 3
//0
//2 1 2
//1 3
//3 2 3 4

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var truth = Set(readLine()!.split(separator: " ").map({ Int(String($0))! })[1...])
var graph = [Set<Int>](repeating: [], count: N + 1)
var party = [[Int]]()

for _ in 0..<M {
    let read = Array(readLine()!.split(separator: " ").map({ Int(String($0))! })[1...])
    party.append(read)
    
    for u in read {
        for v in read {
            graph[u].insert(v)
            graph[v].insert(u)
        }
    }
}

func bfs(_ i: Int) {
    var visit = [Bool](repeating: false, count: N + 1)
    var queue = [i]
    var index = 0
    
    while index < queue.count {
        let first = queue[index]
        index += 1
        
        for j in graph[first] where i != j && !visit[j] {
            visit[j] = true
            queue.append(j)
            graph[i].insert(j)
            graph[j].insert(i)
        }
    }
}

for i in 1...N {
    bfs(i)
}

var newTruth = Set<Int>()

for i in truth {
    for j in graph[i] {
        newTruth.insert(j)
    }
}
var answer = 0

for p in party {
    if !p.contains(where: { newTruth.contains($0) }) {
        answer += 1
    }
}

print(answer)
