////
////  FileIO.swift
////  BJ
////
////  Created by 송재훈 on 9/30/24.
////
//
//
//import Foundation
//
//final class FileIO {
//    private let buffer:[UInt8]
//    private var index: Int = 0
//
//    init(fileHandle: FileHandle = FileHandle.standardInput) {
//        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
//    }
//
//    @inline(__always) private func read() -> UInt8 {
//        defer { index += 1 }
//        
//        return buffer[index]
//    }
//
//    @inline(__always) func readInt() -> Int {
//        var sum = 0
//        var now = read()
//        var isPositive = true
//
//        while now == 10
//                || now == 32 { now = read() } // 공백과 줄바꿈 무시
//        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
//        while now >= 48, now <= 57 {
//            sum = sum * 10 + Int(now-48)
//            now = read()
//        }
//
//        return sum * (isPositive ? 1:-1)
//    }
//
//    @inline(__always) func readString() -> String {
//        var now = read()
//
//        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
//
//        let beginIndex = index-1
//
//        while now != 10,
//              now != 32,
//              now != 0 { now = read() }
//        
//        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
//    }
//
//    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
//        var now = read()
//
//        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
//
//        let beginIndex = index-1
//
//        while now != 10,
//              now != 32,
//              now != 0 { now = read() }
//
//        return Array(buffer[beginIndex..<(index-1)])
//    }
//}
//
//let file = FileIO()
//let (M, N) = (file.readInt(), file.readInt())
//
//let map = (1...M).map { _ in
//    (1...N).map { _ in file.readInt() }
//}
//
//let (dx, dy) = ([0, 1, -1, 0], [1, 0, 0, -1])
//var dp = Array(repeating: Array(repeating: -1, count: 505), count: 505)
//
//func search(_ x: Int, _ y: Int) -> Int {
//    if dp[y][x] != -1 { return dp[y][x] }
//    if x == N - 1 && y == M - 1 { return 1 }
//    dp[y][x] = 0
//    
//    for i in 0..<4 {
//        let (nx, ny) = (x + dx[i], y + dy[i])
//        
//        if nx < 0 || ny < 0 || nx >= N || ny >= M { continue }
//        if map[y][x] > map[ny][nx] {
//            dp[y][x] += search(nx, ny)
//        }
//    }
//    
//    return dp[y][x]
//}
//
//print(search(0, 0))
