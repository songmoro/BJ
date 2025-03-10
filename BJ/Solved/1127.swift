//
//  1127.swift
//  BJ
//
//  Created by 송재훈 on 1/20/25.
//


let a = Dictionary(grouping: String(readLine()!), by: { $0.uppercased() })
let b = a.sorted(by: { $0.value.count > $1.value.count })

if b.count != 1, b[1].value.count == b[0].value.count { print("?")}
else { print(b[0].key) }
