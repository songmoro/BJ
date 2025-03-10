//import Foundation
//
//let N = Int(readLine()!)!
//
//var row = Array(repeating: false, count: 50)
//var diagonal = Array(repeating: false, count: 50)
//var rDiagonal = Array(repeating: false, count: 50)
//
//var result = 0
//
//func solve(_ i: Int) {
//    if i == N {
//        result += 1
//    }
//    else {
//        for j in 0..<N where !row[j] && !diagonal[i + j] && !rDiagonal[i - j + N - 1] {
//            row[j] = true
//            diagonal[i + j] = true
//            rDiagonal[i - j + N - 1] = true
//            solve(i + 1)
//            row[j] = false
//            diagonal[i + j] = false
//            rDiagonal[i - j + N - 1] = false
//        }
//    }
//}
//
//solve(0)
//print(result)
