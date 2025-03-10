//
//  14503.swift
//  BJ
//
//  Created by 송재훈 on 2/2/25.
//


//3 3
//1 1 0
//1 1 1
//1 0 1
//1 1 1
//
//1
//
//11 10
//7 4 0
//1 1 1 1 1 1 1 1 1 1
//1 0 0 0 0 0 0 0 0 1
//1 0 0 0 1 1 1 1 0 1
//1 0 0 1 1 0 0 0 0 1
//1 0 1 1 0 0 0 0 0 1
//1 0 0 0 0 0 0 0 0 1
//1 0 0 0 0 0 0 1 0 1
//1 0 0 0 0 0 1 1 0 1
//1 0 0 0 0 0 1 1 0 1
//1 0 0 0 0 0 0 0 0 1
//1 1 1 1 1 1 1 1 1 1
//
//57

let convertToInt: (ArraySlice<Character>) -> Int = { Int(String($0))! }
let convertToBool: (ArraySlice<Character>) -> Bool = { String($0) == "0" }

let direction: [(r: Int, c: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let forward:  [Int: (r: Int, c: Int)] = [0: (-1, 0), 1: (0, 1), 2: (1, 0), 3: (0, -1)]
let backward: [Int: (r: Int, c: Int)] = [0: (1, 0), 1: (0, -1), 2: (-1, 0), 3: (0, 1)]

let NM = readLine()!.split(separator: " ").map(convertToInt)
var robot = readLine()!.split(separator: " ").map(convertToInt)

var room = [[Bool]]()
var cleaned: [[Bool]] = .init(repeating: .init(repeating: false, count: NM[1]), count: NM[0])

for _ in 0..<NM[0] {
    room.append(readLine()!.split(separator: " ").map(convertToBool))
}

func oob(r: Int, c: Int) -> Bool {
    r < 0 || c < 0 || r >= NM[0] || c >= NM[1]
}

var answer = 0

while true {
    var current: (r: Int, c: Int, p: Int) = (robot[0], robot[1], robot[2])
    
    if !cleaned[current.r][current.c] {
        cleaned[current.r][current.c] = true
        answer += 1
    }
    
    var hasUnclean = false
    
    for d in direction {
        let moved: (r: Int, c: Int) = (current.r + d.r, current.c + d.c)
        
        if oob(r: moved.r, c: moved.c) {
            continue
        }
        
        if room[moved.r][moved.c], !cleaned[moved.r][moved.c] {
            hasUnclean = true
            break
        }
    }
    
    if hasUnclean {
        current.p = (current.p + 3) % 4
        robot = [current.r, current.c, current.p]
        
        let moved: (r: Int, c: Int) = (current.r + forward[current.p]!.r, current.c + forward[current.p]!.c)
        
        if !oob(r: moved.r, c: moved.c), !cleaned[moved.r][moved.c], room[moved.r][moved.c] {
            robot = [moved.r, moved.c, current.p]
        }
    }
    else {
        let moved: (r: Int, c: Int) = (current.r + backward[current.p]!.r, current.c + backward[current.p]!.c)
        robot = [moved.r, moved.c, current.p]
        
        if oob(r: moved.r, c: moved.c) || !room[moved.r][moved.c] {
            break
        }
    }
}

print(answer)


//현재 칸이 아직 청소되지 않은 경우, 현재 칸을 청소한다.
//현재 칸의 주변 4칸 중 청소되지 않은 빈 칸이 없는 경우,
//  바라보는 방향을 유지한 채로 한 칸 후진할 수 있다면 한 칸 후진하고 1번으로 돌아간다.
//  바라보는 방향의 뒤쪽 칸이 벽이라 후진할 수 없다면 작동을 멈춘다.
//현재 칸의 주변 4칸 중 청소되지 않은 빈 칸이 있는 경우,
//  반시계 방향으로 90도 회전한다.
//  바라보는 방향을 기준으로 앞쪽 칸이 청소되지 않은 빈 칸인 경우 한 칸 전진한다.
//  1번으로 돌아간다.
