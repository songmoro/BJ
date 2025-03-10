//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let arr: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
//
//var current = [String]()
//
//func solve(_ i: Int) {
//    if current.count == input[1] {
//        print(current.joined(separator: " "))
//        return
//    }
//    
//    for j in 0..<(arr.count) {
//        current.append(String(arr[j]))
//        solve(j)
//        current.removeLast()
//    }
//}
//
//solve(0)
