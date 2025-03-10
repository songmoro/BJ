//
//  FileIO.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//9 3 5
//1 2 3
//1 4 5
//3 6 7
//5 6 7
//6 8 9

import Foundation

let file = FileIO()

let (N, K, M) = (file.readInt(), file.readInt(), file.readInt())
var stations = [[Int]](repeating: [], count: N + 1)
var tubes = [[Int]](repeating: [], count: M + 1)

for i in 1...M {
    let edge = (0..<K).map { _ in file.readInt() }
    tubes[i] = edge
    
    for station in edge {
        stations[station].append(i)
    }
}

var queue = [1]
var index = 0
var visitStations = [Int](repeating: -1, count: N + 1)
var visitTubes = [Bool](repeating: false, count: M + 1)

visitStations[1] = 1

loop:
while index < queue.count {
    let first = queue[index]
    index += 1
    
    for i in stations[first] where !visitTubes[i] {
        visitTubes[i] = true
        
        for j in tubes[i] where visitStations[j] == -1 {
            visitStations[j] = visitStations[first] + 1
            
            if j == N { break loop }
            queue.append(j)
        }
    }
}

print(visitStations[N])

// ---

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
