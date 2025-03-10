//
//  1697.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//5 17

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (NK[0], NK[1])

var map = [Int](repeating: -1, count: 100001)
map[N] = 0

var queue = [N]
var index = 0

while index < queue.count {
    let first = queue[index]
    index += 1
    
    if first == K {
        print(map[first])
        break
    }
    
    for next in [first - 1, first + 1, first * 2] {
        if next >= 0, next <= 100000, map[next] == -1 {
            map[next] = map[first] + 1
            queue.append(next)
        }
    }
}
