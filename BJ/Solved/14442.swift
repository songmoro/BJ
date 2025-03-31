//
//  FileIO.swift
//  BJ
//
//  Created by 송재훈 on 3/31/25.
//


//6 4 1
//0100
//1110
//1000
//0000
//0111
//0000

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

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
let file = FileIO()
let (N, M, K) = (file.readInt(), file.readInt(), file.readInt())

var board = [[Bool]]()

for _ in 0..<N {
    let input = file.readString().map { String($0) == "0" }
    board.append(input)
}

var visited = Array(repeating: Array(repeating: Array(repeating: false, count: K + 1), count: M), count: N)

var queue: [(x: Int, y: Int, k: Int, dist: Int)] = [(0, 0, K, 1)]
visited[0][0][K] = true

var index = 0
var answer = -1

while index < queue.count {
    let (x, y, k, dist) = queue[index]
    index += 1
    
    if x == N - 1, y == M - 1 {
        answer = dist
        break
    }
    
    for i in 0...3 {
        let (nx, ny) = (x + dx[i], y + dy[i])
        
        if nx < 0 || ny < 0 || nx >= N || ny >= M { continue }
        
        if !board[nx][ny], k > 0, !visited[nx][ny][k - 1] {
            visited[nx][ny][k - 1] = true
            queue.append((nx, ny, k - 1, dist + 1))
        }
        else if board[nx][ny], !visited[nx][ny][k] {
            visited[nx][ny][k] = true
            queue.append((nx, ny, k, dist + 1))
        }
    }
}

print(answer)
