////
////  main.swift
////  BJ
////
////  Created by 송재훈 on 3/25/24.
////
//
//import Foundation
//
//// 1. 연구소 = N * M
//// 2. 연구소<빈 칸 = 0, 벽 = 1, 바이러스 = 2>
//
//let size = readLine()!.split(separator: " ").map({ Int($0)! })
//let delta = [(0, 1), (0, -1), (1, 0), (-1, 0)]
//var lab: [[Int]] = []
//var emptyAreaList = [String]()
//var virusList = [(Int, Int)]()
//var permutationList = Set<String>()
//
//for _ in 0..<size[0] {
//    lab.append(readLine()!.split(separator: " ").map({ Int($0)! }))
//}
//
//for i in 0..<size[0] {
//    for j in 0..<size[1] {
//        if lab[i][j] == 0 {
//            emptyAreaList.append("\(i)\(j)")
//        }
//        else if lab[i][j] == 2 {
//            virusList.append((i, j))
//        }
//    }
//}
//
//func countWall(_ lab: [[Int]]) -> Int {
//    var count = 0
//    
//    for i in 0..<size[0] {
//        for j in 0..<size[1] {
//            if lab[i][j] == 0 {
//                count += 1
//            }
//        }
//    }
//    
//    return count
//}
//
//func permute() {
//    permutationList = emptyAreaList.reduce(into: Set<String>()) { partialResult, i in
//        emptyAreaList.forEach { j in
//            emptyAreaList.forEach { k in
//                if i != j, i != k, j != k {
//                    let array = [i, j, k].sorted()
//                    partialResult.insert("\(array[0])\(array[1])\(array[2])")
//                }
//            }
//        }
//    }
//}
//
//permute()
//
//func infect(_ lab: [[Int]]) -> Int {
//    var stack: [(Int, Int)] = virusList
//    var lab = lab
//    
//    while let coord = stack.popLast() {
//        delta.forEach { d in
//            if (0..<size[0]).contains(coord.0 + d.0), (0..<size[1]).contains(coord.1 + d.1), lab[coord.0 + d.0][coord.1 + d.1] == 0 {
//                lab[coord.0 + d.0][coord.1 + d.1] = 2
//                stack.append((coord.0 + d.0, coord.1 + d.1))
//            }
//        }
//    }
//    
//    return countWall(lab)
//}
//
//let safeArea = permutationList.reduce(into: [0]) { partialResult, walls in
//    var tempLab = lab
//    let wall = walls.map({ String($0) })
//    let iWall = wall[0] + wall[1]
//    let jWall = wall[2] + wall[3]
//    let kWall = wall[4] + wall[5]
//    
//    tempLab[Int(String(iWall.first!))!][Int(String(iWall.last!))!] = 1
//    tempLab[Int(String(jWall.first!))!][Int(String(jWall.last!))!] = 1
//    tempLab[Int(String(kWall.first!))!][Int(String(kWall.last!))!] = 1
//    
//    partialResult.append(infect(tempLab))
//}
//
//print(safeArea.max()!)
