//
//  1915.swift
//  BJ
//
//  Created by 송재훈 on 3/15/25.
//


//4 4
//0100
//0111
//1110
//0010

// MARK: i, j에서 가장 큰 정사각형을 만들 수 있는 방법은 왼쪽, 위쪽, 왼쪽 위 대각선에서 같은 크기의 정사각형이 유지되어야 함
// -> 그래서 이 중 min 값 + 1 where arr[i][j] == 1
//    예를 들어 dp[i-1][j] = 2, dp[i][j-1] = 3, dp[i-1][j-1] = 2일 때,
//    dp[i][j]는  2×2 정사각형까지는 가능하지만, 3×3 정사각형은 만들 수 없음 (좌측, 상단 중 하나라도 2이면, 그보다 큰 정사각형을 만들 수 없음).
//    따라서 dp[i][j] = min(2, 3, 2) + 1 = 3이 된다.
// --> 최솟값을 선택하는 이유는, 세 방향 중 하나라도 작은 값이면 정사각형을 만들 수 없기 때문
//     세 방향이 모두 같은 크기의 정사각형을 유지해야만 한 변이 증가한 정사각형을 만들 수 있음

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var arr = [[Bool]]()
var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 2), count: n + 2)

for i in 0..<n {
    let input = readLine()!.map { String($0) == "1" }
    
    for j in 0..<m where input[j] {
        dp[i][j] = 1
    }
    arr.append(input)
}


for i in 1..<n {
    for j in 1..<m where arr[i][j] {
        dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]) + 1
    }
}

var size = 0

for i in 0..<n {
    for j in 0..<m {
        size = max(size, dp[i][j])
    }
}

print(size * size)
