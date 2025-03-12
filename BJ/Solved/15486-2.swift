//
//  15486-2.swift
//  BJ
//
//  Created by 송재훈 on 3/12/25.
//


//7
//3 10
//5 20
//1 10
//1 20
//2 15
//4 40
//2 200

// MARK: dp[i + 1] = max(dp[i + 1], dp[i])
// 이 구문이 없으면 상담을 하지 않은 경우의 최적해가 유지되지 않음.
// 즉, 상담을 선택하지 않는다면, dp[i]의 값을 그대로 다음 날로 넘겨야 함.
//
// 이 문제는 “상담을 할 수도 있고, 안 할 수도 있는” 선택적 문제

// 만약, 아래와 같이 코드를 작성하면
// dp[i] = max(dp[i], dp[i-T[i]] + P[i])
//
// 이 방식은 “상담을 선택하는 경우만 고려” 하기 때문에, 상담을 하지 않고 넘어가는 경우를 고려하지 않음.

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

let N = file.readInt()
var counseling: [(day: Int, pay: Int)] = [(0, 0)]
var dp = [Int](repeating: 0, count: N + 2)

for _ in 0..<N {
    let (day, pay) = (file.readInt(), file.readInt())
    
    counseling.append((day, pay))
}


for i in 1...N {
    let (day, pay) = (counseling[i].day + i, counseling[i].pay + dp[i])
    if day <= N + 1, dp[day] < pay { dp[day] = pay }
    
    dp[i + 1] = max(dp[i], dp[i + 1])
}

print(dp[N + 1])
//print(dp.reduce(0, +))
