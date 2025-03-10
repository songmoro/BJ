//
//  2480.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//3 3 6

let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

if numbers[0] == numbers[1], numbers[0] == numbers[2] {
    print(10000 + numbers[0] * 1000)
}
else if numbers[0] == numbers[1] || numbers[0] == numbers[2] {
    print(1000 + numbers[0] * 100)
}
else if numbers[1] == numbers[2] {
    print(1000 + numbers[1] * 100)
}
else {
    print(numbers.max()! * 100)
}

