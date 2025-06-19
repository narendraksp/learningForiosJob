//
//  maxwater.swift
//  DSA
//
//  Created by narendra kumar s on 20/03/25.
//

func maxAreaWatwer(_ heightPolls: [Int]) -> Int {
    var res  = 0
    var r = heightPolls.count - 1
    var l = 0
    while (r>l) {
        
        let area = min(heightPolls[l], heightPolls[r]) * (r - l)
        if area > res {
            res = area
        }
        if heightPolls[r] > heightPolls[l] {
            l += 1
        } else {
            r -= 1
        }
    }
    return res
    }
