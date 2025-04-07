//
//  3197.swift
//  BJ
//
//  Created by 송재훈 on 4/7/25.
//

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() }
        let beginIndex = index - 1
        while now != 10, now != 32, now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() }
        let beginIndex = index - 1
        while now != 10, now != 32, now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let file = FileIO()

let (R, C) = (file.readInt(), file.readInt())
var lake = [[Character]]()
var swans = [(Int, Int)]()

for i in 0..<R {
    let row = file.readString().map(Character.init)
    lake.append(row)
    for j in 0..<C {
        if row[j] == "L" { swans.append((i, j)) }
    }
}

let start = swans[0]
let end = swans[1]

var distance = Array(repeating: Array(repeating: -1, count: C), count: R)
var queue = [(Int, Int)]()

for i in 0..<R {
    for j in 0..<C {
        if lake[i][j] != "X" {
            distance[i][j] = 0
            queue.append((i, j))
        }
    }
}

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var index = 0
while index < queue.count {
    let (x, y) = queue[index]
    index += 1

    for d in 0..<4 {
        let nx = x + dx[d]
        let ny = y + dy[d]
        if (0..<R).contains(nx), (0..<C).contains(ny), distance[nx][ny] == -1 {
            distance[nx][ny] = distance[x][y] + 1
            queue.append((nx, ny))
        }
    }
}

func canMeet(limit: Int) -> Bool {
    var visited = Array(repeating: Array(repeating: false, count: C), count: R)
    var q = [(Int, Int)]()
    q.append(start)
    visited[start.0][start.1] = true
    var idx = 0

    while idx < q.count {
        let (x, y) = q[idx]
        idx += 1
        if (x, y) == end { return true }

        for d in 0..<4 {
            let nx = x + dx[d]
            let ny = y + dy[d]

            if (0..<R).contains(nx), (0..<C).contains(ny),
               !visited[nx][ny], distance[nx][ny] <= limit {
                visited[nx][ny] = true
                q.append((nx, ny))
            }
        }
    }
    return false
}

var left = 0
var right = distance.flatMap { $0 }.max()!
var answer = 0

while left <= right {
    let mid = (left + right) / 2
    if canMeet(limit: mid) {
        answer = mid
        right = mid - 1
    }
    else {
        left = mid + 1
    }
}

print(answer)
