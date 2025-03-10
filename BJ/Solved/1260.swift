//
//  1260.swift
//  BJ
//
//  Created by 송재훈 on 2/15/25.
//


//4 5 1
//1 2
//1 3
//1 4
//2 4
//3 4

let NMV = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M, V) = (NMV[0], NMV[1], NMV[2] - 1)

var graph: [[Bool]] = .init(repeating: .init(repeating: false, count: N), count: N)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map({ Int($0)! - 1 })
    (graph[input[0]][input[1]], graph[input[1]][input[0]]) = (true, true)
}

let visit: [Bool] = .init(repeating: false, count: N)
var (stack, queue) = ([V], [V])
var (stackVisit, queueVisit) = (visit, visit)
var (stackAnswer, queueAnswer) = ([String(V + 1)], [String(V + 1)])
(stackVisit[V], queueVisit[V]) = (true, true)

while !stack.isEmpty {
    let last = stack.removeLast()
    
    for i in 0..<N where i != last && !stackVisit[i] && graph[last][i] {
        stack.append(last)
        stack.append(i)
        stackVisit[i] = true
        stackAnswer.append(String(i + 1))
        break
    }
}

while !queue.isEmpty {
    let first = queue.removeFirst()
    
    for i in 0..<N where i != first && !queueVisit[i] && graph[first][i] {
        queue.append(i)
        queueVisit[i] = true
        queueAnswer.append(String(i + 1))
    }
}

print(stackAnswer.joined(separator: " "))
print(queueAnswer.joined(separator: " "))

//5 5 1
//1 2
//1 3
//2 4
//4 3
//4 5
//1 2 4 3
//1 2 3 4 5
//
//[1, 2, 4, 3, 5]
//[1, 2, 3, 4, 5]
