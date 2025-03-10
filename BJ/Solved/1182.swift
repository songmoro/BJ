//import Foundation
//
//let input1 = readLine()!.split(separator: " ").map { Int($0)! }
//let arr = readLine()!.split(separator: " ").map { Int($0)! } + [0]
//
//let (N, S) = (input1[0], input1[1])
//
//var result = 0
//
//func solve(index i: Int, partial p: Int) {
//    if i == N {
//        result += (p == S ? 1 : 0)
//    }
//    else {
//        solve(index: i + 1, partial: p + arr[i])
//        solve(index: i + 1, partial: p)
//    }
//}
//
//solve(index: 0, partial: 0)
//
//print(result - (S == 0 ? 1 : 0))
