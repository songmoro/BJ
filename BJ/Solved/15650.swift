//import Foundation
//
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let (N, M) = (input[0], input[1])
//
//let arr = Array(1...N)
//var visited = Array(repeating: false, count: arr.count)
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
//        for j in i..<(arr.count) where !visited[j] {
//            visited[j] = true
//            solve(j, current + [arr[j]])
//            visited[j] = false
//        }
//    }
//}
//
//solve(0, [])
//print(result)
