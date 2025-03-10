//
//  2096.swift
//  BJ
//
//  Created by 송재훈 on 2/14/25.
//


//3
//1 2 3
//4 5 6
//4 9 0

let N = Int(readLine()!)!

var lines = [[Int]]()
for _ in 0..<N {
    lines.append(readLine()!.split(separator: " ").map({ Int($0)! }))
}

var (maxDp, minDp) = (lines, lines)

for i in 1..<N {
    maxDp[i][0] += maxDp[i - 1][...1].max()!
    minDp[i][0] += minDp[i - 1][...1].min()!
    
    maxDp[i][1] += maxDp[i - 1].max()!
    minDp[i][1] += minDp[i - 1].min()!
    
    maxDp[i][2] += maxDp[i - 1][1...].max()!
    minDp[i][2] += minDp[i - 1][1...].min()!
}

print(maxDp.last!.max()!, minDp.last!.min()!)
