//
//  11660.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//4 3
//1 2 3 4
//2 3 4 5
//3 4 5 6
//4 5 6 7
//2 2 3 4
//3 4 3 4
//1 1 4 4

//print([1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6, 4, 5, 6, 7].reduce(0, +))

// MARK: i, j번 누적합은 i..., j...의 합
// -> 0, 3 = (0, 0), (0, 1), (0, 2), (0, 3)
// -> 3, 0 = (0, 0), (1, 0), (2, 0), (3, 0)
// -> 3, 3 = (0...3, 0...3)
// --> 테이블 현재 값 + (i - 1, j) 값, (i, j - 1) 값, - (i - 1, j - 1)

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var table = [[Int]]()
var dp = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    table.append(input)
}

for i in 1...N {
    for j in 1...N {
        dp[i][j] = table[i - 1][j - 1] + dp[i - 1][j] + dp[i][j - 1] - dp[i - 1][j - 1]
    }
}

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
    print(dp[x2][y2] - dp[x1 - 1][y2] - dp[x2][y1 - 1] + dp[x1 - 1][y1 - 1])
}

//print(64 + 27 - 42 - 42)


//2 2 3 4
//dp[3][4], dp[2 - 1][4], dp[3][2 - 1], dp[2 - 1][2 - 1]
//42, 10, 6, 1
//42 - 10 - 6 + 1
// 구해야하는 구간 테이블
//[0, 0, 0, 0, 0]
//[0, 3, 3, 5, 0]
//[0, 4, 4, 6, 0]
//[0, 0, 0, 0, 0]
//[0, 0, 0, 0, 0]
// dp 상태
//[0, 0, 0, 0, 0]
//[0, 1, 3, 6, 10]
//[0, 3, 8, 15, 24]
//[0, 6, 15, 27, 42]
//[0, 10, 24, 42, 64]
//

