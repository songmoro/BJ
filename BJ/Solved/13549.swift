//
//  13549.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//

let MAX = 100001
let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (NK[0], NK[1])

var distance = [Int](repeating: -1, count: MAX)
distance[N] = 0

var deque = [(N, 0)]

// MARK: index 쓰지 않은 이유 - insert 구문으로 인해 큐가 꼬일 수 있음

while !deque.isEmpty {
    let (pos, time) = deque.removeFirst()

    if pos == K {
        print(time)
        break
    }

    if pos * 2 < MAX, distance[pos * 2] == -1 {
        deque.insert((pos * 2, time), at: 0)
        distance[pos * 2] = time
    }
    if pos - 1 >= 0, distance[pos - 1] == -1 {
        deque.append((pos - 1, time + 1))
        distance[pos - 1] = time + 1
    }
    if pos + 1 < MAX, distance[pos + 1] == -1 {
        deque.append((pos + 1, time + 1))
        distance[pos + 1] = time + 1
    }
}
