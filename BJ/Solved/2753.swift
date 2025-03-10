//
//  2753.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//2000

let year = Int(readLine()!)!

if year % 400 == 0 { print(1) }
else if (year % 4 == 0), (year % 100 != 0) { print(1) }
else { print(0) }
