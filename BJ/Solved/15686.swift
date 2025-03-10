////
////  main.swift
////  BJ
////
////  Created by 송재훈 on 3/25/24.
////
//
//import Foundation
//
//// 1. map<0: 빈칸, 1: 집, 2: 치킨 집>
//// 2. 치킨 거리 = |r1 - c1| + |r2 - c2|, 여러 치킨 집이 있다면 가까운 거리
//// 3. 1~M 개 까지
//// 4. 치킨 집이 더 늘어나지 않음 == 미리 거리 구해두기
//
//let input = readLine()!.split(separator: " ").map({ Int($0)! })
//let N = input[0], M = input[1]
//var houses = [(Int, Int)]()
//var stores = [(Int, Int)]()
//var chickenDistance = Int.max
//
//for i in 0..<N {
//    let array = readLine()!.split(separator: " ").map({ Int($0)! })
//    
//    for j in 0..<N {
//        if array[j] == 1 {
//            houses.append((i, j))
//        }
//        else if array[j] == 2 {
//            stores.append((i, j))
//        }
//    }
//}
//
//func calcCombination(_ index: Int, _ selected: [(Int, Int)]) {
//    if selected.count == M {
//        let tempDistance = houses.reduce(into: 0) { partialResult, house in
//            var distance = Int.max
//            
//            selected.forEach { store in
//                distance = min((abs(house.0 - store.0) + abs(house.1 - store.1)), distance)
//            }
//            
//            partialResult += distance
//        }
//        
//        chickenDistance = min(tempDistance, chickenDistance)
//    }
//    else {
//        for i in index..<stores.count {
//            calcCombination(i + 1, selected + [stores[i]])
//        }
//    }
//}
//
//calcCombination(0, [])
//
//print(chickenDistance)
