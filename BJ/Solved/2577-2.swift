//
//  File.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//150
//266
//427

let one = Int(readLine()!)!
let two = Int(readLine()!)!
let three = Int(readLine()!)!

var numbers = [0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0]

for number in String(one * two * three) {
    numbers[Int(String(number))!]! += 1
}

for number in numbers.sorted(by: { $0.key < $1.key }) {
    print(number.value)
}
