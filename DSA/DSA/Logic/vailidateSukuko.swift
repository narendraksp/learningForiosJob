//
//  vailidateSukuko.swift
//  DSA
//
//  Created by narendra kumar s on 12/03/25.
//

func validationSudukoForLooop(arrryInt:[[String]]) -> Bool{
    
    for row in 0...8 {
        var checkSet:Set<String> = []
        for col in 0...8{
            if arrryInt[row][col] == "." {
                continue
            } else if checkSet.contains( arrryInt[row][col])  {
                return false
            } else {
                checkSet.insert(arrryInt[row][col])
            }
        }
    }
    
    for col in 0...8 {
        var checkSet:Set<String> = []
        for row in 0...8{
            if arrryInt[row][col] == "." {
                continue
            } else if checkSet.contains( arrryInt[row][col])  {
                return false
            } else {
                checkSet.insert(arrryInt[row][col])
            }
        }
    }
    for sq in 0...8 {
        var checkSet:Set<String> = []
        for i in 0..<3{
            for j in 0...2{
                let row:Int = (sq/3) * 3 + i
                let  col:Int = (sq % 3) * 3 + j
                if arrryInt[row][col] == "." {
                    continue
                } else if checkSet.contains( arrryInt[row][col])  {
                    return false
                } else {
                    checkSet.insert(arrryInt[row][col])
                }
            }
        }
    }
    return true
    }


func isValidSudoku(_ board: [[Character]]) -> Bool {
    var row:[Int] = Array(repeating: 0, count: 9)
    var col:[Int] = Array(repeating: 0, count: 9)
    var squ:[Int] = Array(repeating: 0, count: 9)
    for r in 0..<9{
        for c in 0..<9{
            if board[r][c] == "." {
                continue
            }
            let val = Int( board[r][c].asciiValue! - Character("1").asciiValue!)
            if   ((row[r] & (1 << val)) != 0) ||   ((col[c] & (1 << val)) != 0) ||   ((squ[(r/3 * 3 + c/3)] & (1 << val)) != 0) {
                return false
            }
            row[r] |= (1 << val)
            col[c] |= (1 << val)
            squ[(r/3 * 3 + c/3)] |= (1 << val)
        }
    }
    return true
    }
