//
//  TopKFrequent.swift
//  DSA
//
//  Created by narendra kumar s on 10/03/25.
//

func topKFrequent(_ nums: [Int], freq:Int) -> [Int] {
    var dictArray:[Int:Int] = [:]
    for vale in nums {
        dictArray[vale, default: 0]  += 1
    }
    var result:[Int] = []
    for(key, value)  in dictArray {
        if value >= freq {
            result.append(key)
        }
        
    }
    return result
}



func topKFrequentCorrect(_ nums: [Int], freq:Int) -> [Int] {
    var dictArray:[Int:Int] = [:]
    for vale in nums {
        dictArray[vale, default: 0]  += 1
    }
    var referArry:[[Int]] = Array(repeating: [], count: (dictArray.values.max() ?? 0) + 1)
    for (key,value) in dictArray {
        
        referArry[value].append(key)
    }
    var result:[Int] = []
    for value in referArry.reversed() {
        if value.count > 0 {
            
            for n in value {
                result.append(n)
                if result.count >= freq {
                    
                    return result
                }
            }
        }
    }
    return result
    }
