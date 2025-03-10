
//6 7
//3 6
//4 3
//3 2
//1 3
//1 2
//2 4
//5 2

import Foundation

let file = FileIO()
let (N, M) = (file.readInt(), file.readInt())
var graph = [[Int]](repeating: [], count: N + 1)

for _ in 0..<M {
    let (u, v) = (file.readInt(), file.readInt())
    
    graph[u].append(v)
    graph[v].append(u)
}

var (queue, index) = ([1], 0)
var visit = [Int](repeating: -1, count: N + 1)
visit[1] = 0

while index < queue.count {
    let first = queue[index]
    index += 1
    
    for i in graph[first] where visit[i] == -1 {
        queue.append(i)
        visit[i] = visit[first] + 1
    }
}

var answer = (0, 0, 0)

for (i, e) in visit.enumerated() {
    if e > answer.1 { answer = (i, e, 1) }
    else if e == answer.1 { answer.2 += 1 }
}

print(answer.0, answer.1, answer.2)

//

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
