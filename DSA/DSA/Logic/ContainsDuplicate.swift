//
//  Untitled.swift
//  DSA
//
//  Created by narendra kumar s on 20/02/25.
//

class ContainsDuplicate {
    func checkDuplicateItemUsingSorting(_ arr: [Int]) -> Bool {
        let sortedArray = arr.sorted()
        for index in 1..<sortedArray.count {
            if sortedArray[index] == sortedArray[index-1] {
                return true
            }
        }
        return false
    }
    
    
    

func checkDuplicateItemUsingHashSet(_ arr: [Int]) -> Bool {
    var hashSet: Set<Int> = []
    for valee in arr {
        if !hashSet.contains(valee) {
            hashSet.insert(valee)
        }else{
            print("it cointain duplicate")
            return true
        }
    }
    print("it does not contain duplicate")

    return false
}



}
