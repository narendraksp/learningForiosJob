//
//  Untitled.swift
//  DSA
//
//  Created by narendra kumar s on 16/03/25.
//
// using 2 point approch
//Time complexity: O(n)O(n)
//Space complexity: O(1)O(1)

func isValidatePangrom(str:String) ->Bool {
    let arry = Array(str)
    var r = arry.count - 1
    var  l = 0
    while l < r {
        while(!arry[l].isLetter ){
            
            l += 1
        }
        while(!arry[r].isLetter ){
            
            r -= 1
        }
        if  arry[l].lowercased() != arry[r].lowercased(){
            
            return false
            
        } else {
            r -= 1
            l += 1
        }
    }
    return true
}

