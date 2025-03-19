//
//  1654.swift
//  BJ
//
//  Created by 송재훈 on 3/19/25.
//


//4 11
//802
//743
//457
//539

// MARK: left = 1 -> lan 최소 길이
// MARK: left = mid + 1 -> left보다 더 큰 값이 있어야하는지 탐색해야 함

let KN = readLine()!.split(separator: " ").map { Int(String($0))! }
let (K, N) = (KN[0], KN[1])
var lans = [Int]()

for _ in 0..<K {
    let input = Int(readLine()!)!
    lans.append(input)
}

var maxLength = 1
var (left, right) = (1, lans.max()!)

while left <= right {
    let mid = (left + right) / 2
    let count = lans.reduce(0) { $0 + $1 / mid }
    
    if count >= N {
        maxLength = max(maxLength, mid)
        left = mid + 1
    }
    else { right = mid - 1 }
}

print(maxLength)
//print((802 + 743 + 457 + 539) / 11)
