//
//  TestLogic.swift
//  DSA
//
//  Created by narendra kumar s on 27/02/25.
//

class TestLogic {
    var link =   LinkedList<Int>()
    func callMainFunc(){
        print("loging")
        
        
        example()
        
        
    }
    
    
    func example() {
        
        var tree = AVLTree<Int>()
        tree.insert(10)
        tree.insert(20)
        tree.insert(3)
        tree.insert(4)
        tree.insert(1)
        tree.insert(13)
        tree.insert(11)
        tree.insert(14)
        tree.insert(15)
        tree.insert(16)
        tree.insert(21)
        tree.insert(22)
        tree.insert(2)
        tree.insert(5)
        print(tree)
        print(tree.root?.value)
        print(tree.root?.right?.hieght)

    }
        ///it take O(n)
        ///
    
    
        //
        ///Longest Consecutive Sequence
        ///
        ///
        ///
    func maxTrapWater(_ heightPolls: [Int]) -> Int {
        var res  = 0
        var r = heightPolls.count - 1
        var l = 0
        var leftHighst = heightPolls[l]
        var rightHighest = heightPolls[r]
        while (l < r) {
            if leftHighst < rightHighest {
                
                l += 1
                let maxNumber = max(leftHighst, heightPolls[l])
                leftHighst = maxNumber
                res += (maxNumber - heightPolls[l])
            } else {
                
                r -= 1
                let maxNumber = max(rightHighest, heightPolls[r])
                rightHighest = maxNumber
                res += (maxNumber - heightPolls[r])
            }
   
        }
        return res
    }
    
}
