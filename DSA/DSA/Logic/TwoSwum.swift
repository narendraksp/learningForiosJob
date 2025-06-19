//
//  TwoSwum.swift
//  DSA
//
//  Created by narendra kumar s on 05/03/25.
//
//Time complexity: O(n)O(n)
//Space complexity: O(n)
func twoSum(arry:[Int],target:Int) -> [Int]{
    var dict:[Int:Int] = [:]
    for (key ,value) in arry.enumerated() {
        let dif  = target - value
        if let index = dict[value] {
            return [key, index]
        }
        dict[dif] = key
        print(dict)
    }
    return []
    
}

//Time complexity: O(n)O(n)
//Space complexity: O(1)O(1)
func twoSumwith(arry:[Int],target:Int) ->[[Int]] {
    var res:[[Int]] = []
    var l = 0
    var r = arry.count - 1
    while (l<r) {
        print("aaaloging")
        var sum = arry[l] + arry[r]
        
        if sum > target {
            
            r -= 1
        }else if target > sum {
            l += 1
            
        } else {
            res.append([arry[l] , arry[r]])
            r -= 1
            l += 1
        }
        
    }
    return res
}
///slideing method

func threeSumwith(arryInput:[Int],target:Int) ->[[Int]] {
    var res:[[Int]] = []
    let arry = arryInput.sorted()
    for i in 0..<arry.count {
        var l = i + 1
        var r = arry.count - 1
        while (l<r) {
            var sum = arry[i] + arry[l] + arry[r]
            if sum > target {
                r -= 1
            }else if target > sum {
                l += 1
                
            } else {
                res.append([arry[i],arry[l] , arry[r]])
                r -= 1
                l += 1
            }
            
        }}
    return res
}

