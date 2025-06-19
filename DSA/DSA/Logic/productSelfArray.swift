//
//  productSelfArray.swift
//  DSA
//
//  Created by narendra kumar s on 10/03/25.
//

func prudctallElement(nums:[Int]) -> [Int]{
    var res = Array(repeating: 0, count: nums.count)
    for index in 0..<nums.count{
        var result = 1
        for ind in 0..<nums.count{
            if ind != index {
                result *= nums[ind]
                
            }
        }
        res[index] = result
        
    }
    
    return res
    }

// fir
func productExceptSelfUsingProduct(nums:[Int]) -> [Int]{
    var res = Array(repeating: 0, count: nums.count)
    res[0] = 1
    var total_Product = 1
    for i in 0...(nums.count - 1) {
        total_Product *= nums[i]
    }
    for i in 0...(nums.count - 1) {
        res[i] = total_Product / nums[i]
    }
    return res
}


func productExceptSelfprefixMethod(nums:[Int]) -> [Int]{
    var res = Array(repeating: 0, count: nums.count)
    res[0] = 1
    for i in 1...(nums.count - 1) {
        res[i] = res[i - 1] * nums [i - 1]
        
    }
    var prefix:Int = 1
    for i in stride(from: nums.count - 1, through: 0, by: -1) {
        res[i] *= prefix
        prefix *= nums[i]
    }
    return res
    }
