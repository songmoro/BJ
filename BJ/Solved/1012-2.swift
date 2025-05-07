//
//  1012-2.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
//


//2
//10 8 17
//0 0
//1 0
//1 1
//4 2
//4 3
//4 5
//2 4
//3 4
//7 4
//8 4
//9 4
//7 5
//8 5
//9 5
//7 6
//8 6
//9 6
//10 10 1
//5 5

import Foundation
bj1012()

func bj1012() {
    let file = FileIO()
    let T = file.readInt()
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    for _ in 0..<T {
        let (M, N, K) = (file.readInt(), file.readInt(), file.readInt())
        var board = Array(repeating: Array(repeating: false, count: N), count: M)
        
        for _ in 0..<K {
            let (X, Y) = (file.readInt(), file.readInt())
            board[X][Y] = true
        }
        
        var answer = 0
        
        for i in 0..<M {
            for j in 0..<N {
                if board[i][j] {
                    answer += 1
                    board[i][j] = false
                    
                    var stack = [(i, j)]
                    
                    while !stack.isEmpty {
                        let (x, y) = stack.removeLast()
                        
                        for d in 0...3 {
                            let nx = x + dx[d]
                            let ny = y + dy[d]
                            
                            if (0..<M) ~= nx, (0..<N) ~= ny, board[nx][ny] {
                                board[nx][ny] = false
                                stack.append((nx, ny))
                            }
                        }
                    }
                }
            }
        }
        
        print(answer)
    }
    
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

}
