//
//  6603.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//7 1 2 3 4 5 6 7
//8 1 2 3 5 8 13 21 34
//0

while true {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    if input[0] == 0 { break }
    
    let N = input[0]
    let numbers = Array(input[1...])
    var answer = ""
    
    func back(_ i: Int, _ current: [String]) {
        if i == N {
            if current.count == 6 {
                answer.append(current.joined(separator: " ") + "\n")
            }
        }
        else {
            back(i + 1, current + [String(numbers[i])])
            back(i + 1, current)
        }
    }
    
    back(0, [])
    print(answer)
}
