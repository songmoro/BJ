//let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (N, M) = (input1[0], input1[1])
//
//var office = [[Int]]()
//var cctvs = [(i: Int, j: Int)]()
//
//for i in 0..<N {
//    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
//    office += [arr]
//    
//    for j in 0..<M {
//        if 1...5 ~= arr[j] {
//            cctvs.append((i, j))
//        }
//    }
//}
//
//func solution(_ office: [[Int]]) {
//    var tempOffice = [[Int]]()
//    var result = countZero(office)
//    
//    let dx = [-1, 0, 1, 0]
//    let dy = [0, 1, 0, -1]
//    
//    func countZero(_ office: [[Int]]) -> Int {
//        office.reduce(0, { $0 + $1.reduce(0, { $0 + ($1 == 0 ? 1 : 0) }) })
//    }
//
//    func checkBounds(_ i: Int, _ j: Int) -> Bool {
//        i < 0 || i > (N - 1) || j < 0 || j > (M - 1)
//    }
//
//    func fill(_ cctv: (i: Int, j: Int), _ dir: Int) {
//        let dir = dir % 4
//        var (nextI, nextJ) = cctv
//        
//        while true {
//            nextI += dx[dir]
//            nextJ += dy[dir]
//            
//            if checkBounds(nextI, nextJ) || tempOffice[nextI][nextJ] == 6 {
//                break
//            }
//            else if tempOffice[nextI][nextJ] != 0 {
//                continue
//            }
//            
//            tempOffice[nextI][nextJ] = 7
//        }
//    }
//    
//    for i in 0..<(1 << (2 * cctvs.count)) {
//        tempOffice = office
//        var direction = String(Int(String(i, radix: 4), radix: 10)!)
//        direction = String(repeating: "0", count: max(0, cctvs.count - direction.count)) + direction
//        
//        for (cctv, dir) in zip(cctvs, direction.map { Int(String($0))! }) {
//            if tempOffice[cctv.i][cctv.j] == 1 {
//                fill(cctv, dir)
//            }
//            else if tempOffice[cctv.i][cctv.j] == 2 {
//                fill(cctv, dir)
//                fill(cctv, dir + 2)
//            }
//            else if tempOffice[cctv.i][cctv.j] == 3 {
//                fill(cctv, dir)
//                fill(cctv, dir + 1)
//            }
//            else if tempOffice[cctv.i][cctv.j] == 4 {
//                fill(cctv, dir)
//                fill(cctv, dir + 1)
//                fill(cctv, dir + 2)
//            }
//            else if tempOffice[cctv.i][cctv.j] == 5 {
//                fill(cctv, dir)
//                fill(cctv, dir + 1)
//                fill(cctv, dir + 2)
//                fill(cctv, dir + 3)
//            }
//        }
//        
//        result = min(result, countZero(tempOffice))
//    }
//    
//    print(result)
//}
//
//solution(office)
