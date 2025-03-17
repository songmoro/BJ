//
//  10942.swift
//  BJ
//
//  Created by 송재훈 on 3/17/25.
//


//7
//1 2 1 3 1 2 1
//4
//1 3
//2 5
//3 3
//5 7

// MARK: 길이가 1인 경우
// -> (i == j): 항상 팰린드롬
// MARK: 길이가 2인 경우
// -> (j = i + 1): 두 값이 같으면 팰린드롬
// MARK: 길이가 3 이상인 경우
// -> (j >= i + 2): 첫 번째와 마지막 값이 같고, dp[i + 1][j - 1]도 팰린드롬이면 팰린드롬

//[_, 1, 2, 1, 3, 1, 2, 1]
//[_, 0, 0, 0, 0, 0, 0, 0]
//[_, 1, 0, 1, 0, 0, 0, 1]
//[_, 0, 1, 0, 0, 0, 1, 0]
//[_, 0, 0, 1, 0, 1, 0, 0]
//[_, 0, 0, 0, 1, 0, 0, 0]
//[_, 0, 0, 0, 0, 1, 0, 1]
//[_, 0, 0, 0, 0, 0, 1, 0]
//[_, 0, 0, 0, 0, 0, 0, 1]

import Foundation

let file = FileIO()

let N = file.readInt()
let arr = [0] + (0..<N).map { _ in file.readInt() }
let M = file.readInt()
var dp = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)

for i in 1...N { dp[i][i] = 1 }
for i in 1..<N where arr[i] == arr[i + 1] { dp[i][i + 1] = 1 }

for length in 2..<N {
    for i in 1...(N - length) {
        let j = i + length
        
        if arr[i] == arr[j], dp[i + 1][j - 1] == 1 {
            dp[i][j] = 1
        }
    }
}

let result = (0..<M).map { _ in
    let query = (file.readInt(), file.readInt())
    return "\(dp[query.0][query.1])"
}.joined(separator: "\n")

print(result)

// --

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
