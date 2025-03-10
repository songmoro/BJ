//var pyramid: [[Int]] = (1...Int(readLine()!)!).map { _ in
//    readLine()!.split(separator: " ").map { Int(String($0))! }
//}
//
//for i in 1..<pyramid.count {
//    for j in 0..<pyramid[i].count {
//        if j == 0 { pyramid[i][j] += pyramid[i - 1][j] }
//        else if j == pyramid[i].count - 1 { pyramid[i][j] += pyramid[i - 1][j - 1] }
//        else { pyramid[i][j] += max(pyramid[i - 1][j - 1], pyramid[i - 1][j]) }
//    }
//}
//
//print(pyramid.last!.max()!)
