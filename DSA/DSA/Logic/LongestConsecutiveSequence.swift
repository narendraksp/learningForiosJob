//
//  LongestConsecutiveSequence.swift
//  DSA
//
//  Created by narendra kumar s on 16/03/25.
//

func getLogestConsecutive(nums:[Int]) -> Int {
    var setValue :[Int] = []
    for value in nums {
        setValue.append(value)
    }
    var logest:Int = 0
    for num in setValue {
        if !setValue.contains(num - 1) {
            var lenght = 1
            while (setValue.contains(num + lenght)) {
                lenght += 1
            }
            logest =  max(lenght,lenght)
        }
    }
    return logest
    }
