//
//  4659.swift
//  BJ
//
//  Created by 송재훈 on 1/20/25.
//



//a
//tv
//ptoui
//bontres
//zoggax
//wiinq
//eep
//houctuh
//end

let vowels = "aeiou"
extension String { func isVowel() -> Bool { vowels.contains(self.first!) } }

loop:
while let read = readLine(), read != "end" {
    let isContains = read.contains { vowels.contains($0) }
    
    if !isContains {
        print("<\(read)> is not acceptable.")
    }
    else {
        let mapped = read.map { String($0) }
        
        for i in 0..<(mapped.count) {
            let char = mapped[i]
            let prefix = mapped[i...].prefix(3)
            let isVowels = prefix.map { $0.isVowel() }
            let withNext = prefix.prefix(2).joined()
            
            if isVowels == [true, true, true] || isVowels == [false, false, false] {
                print("<\(read)> is not acceptable.")
                continue loop
            }
            else if withNext != "ee", withNext != "oo", "\(char)\(char)" == withNext {
                print("<\(read)> is not acceptable.")
                continue loop
            }
        }
        
        print("<\(read)> is acceptable.")
    }
}
