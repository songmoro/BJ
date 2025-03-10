//import Foundation
//
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let (N, M) = (input[0], input[1])
//
//let arr = Array(1...N)
//var result = ""
//
//func solve(_ i: Int, _ current: [Int]) {
//    if current.count == M {
//        for j in current {
//            result += "\(j) "
//        }
//        result += "\n"
//    }
//    else {
//        for j in 0..<(arr.count) {
//            solve(j, current + [arr[j]])
//        }
//    }
//}
//
//solve(0, [])
//print(result)
