//
//  5014.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//10 1 10 2 1

let FSGUD = readLine()!.split(separator: " ").map { Int(String($0))! }
let (F, S, G, U, D) = (FSGUD[0], FSGUD[1], FSGUD[2], FSGUD[3], FSGUD[4])

var distance = [Int](repeating: -1, count: F + 1)
distance[S] = 0
var queue = [S]
var index = 0

while index < queue.count {
    let first = queue[index]
    index += 1
    
    if first == G {
        break
    }
    
    if first + U <= F, distance[first + U] == -1 {
        distance[first + U] = distance[first] + 1
        queue.append(first + U)
    }
    if first - D >= 1, distance[first - D] == -1 {
        distance[first - D] = distance[first] + 1
        queue.append(first - D)
    }
}

print(distance[G] == -1 ? "use the stairs" : distance[G])
