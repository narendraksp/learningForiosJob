//
//  AVLtree.swift
//  DSA
//
//  Created by narendra kumar s on 23/04/25.
//

class AVLNode<T>{
    var value:T
    var right: AVLNode<T>?
    var left: AVLNode<T>?
    var hieght:Int
    init(value: T) {
        self.value = value
        self.hieght = 1
    }
    
}
struct AVLTree<T> where T :Comparable{
    var root:AVLNode<T>?
    
    mutating func insert( _ value: T) {
        self.root =   insertHelp(node: self.root, value: value)
    }
    
    func insertHelp(node:AVLNode<T>?, value:T) -> AVLNode<T> {
        guard let node = node else {
            return AVLNode(value: value)
        }
        if node.value > value {
            
            node.left = insertHelp(node: node.left, value: value)
        } else if node.value < value {
            node.right = insertHelp(node: node.right, value: value)
        }
        node.hieght = hieghtCalcultate(node: node)
        return balance(node: node)
    }
    func balenceFactor(node:AVLNode<T>?) -> Int {
        guard let node = node else {
            return 0
        }
        return (node.left?.hieght ?? 0) - (node.right?.hieght ?? 0)
    }
    func hieghtCalcultate(node:AVLNode<T>) -> Int{
        return  (max(node.right?.hieght ?? 0, node.left?.hieght ?? 0) + 1)
    }
    
 
    func balance(node:AVLNode<T>) -> AVLNode<T>{
        let banfanceFactor = balenceFactor(node: node)
        if banfanceFactor > 1 {
            if ( balenceFactor(node: node.right) >  0) {
                node.right =    leftRotete(node: node.right!)
            }
            return rightRotete(node: node)
        }
        if banfanceFactor < -1 {
            if (balenceFactor(node:node.left) < 0) {
                node.left = rightRotete(node: node.left!)
            }
            return leftRotete(node: node)
        }
        return node
    }
    func leftRotete(node:AVLNode<T>) -> AVLNode<T> {
        let x = node.right!
        let t2 = x.left
        x.left = node
        node.right = t2
        node.hieght =   hieghtCalcultate(node: node)
        x.hieght =   hieghtCalcultate(node: x)
        return x
    }
    

    
    func rightRotete(node:AVLNode<T>) -> AVLNode<T> {
        let x = node.left!
        let t2 = x.right
        x.right = node
        node.left = t2
        node.hieght =   hieghtCalcultate(node: node)
        x.hieght =   hieghtCalcultate(node: x)
        return x
    }
    
    mutating func detele(value:T) {
        self.root = deleteHelper(node: root, value: value)
    }
    
    func deleteHelper(node:AVLNode<T>?, value:T) -> AVLNode<T>? {
        guard let node = node else {
            return nil
        }
        if node.value > value {
            node.right = deleteHelper(node: node.right, value: value)
        } else if node.value < value {
            node.left = deleteHelper(node: node.left, value: value)
        } else if node.value == value {
            if node.right == nil && node.left == nil {
                return nil
            } else if node.left == nil {
                return node.right
            }else if node.right == nil {
                return node.left
            }else {
                var cuure = node.right
                while(cuure?.left != nil) {
                    cuure = cuure?.left
                }
                cuure?.left = node.left
                return node.right
            }
        }
        return node
    }
    func seach(value:T)-> Bool {
        searchHelper(node: self.root, value: value)
    }
    
    func searchHelper(node:AVLNode<T>?, value:T) -> Bool {
        guard let node = node else {
            return false
        }
        if node.value == value {
            return true
        } else if node.value < value {
            return self.searchHelper(node: node.right, value: value)
        }  else  {
            return self.searchHelper(node: node.left, value: value)
        }
    }
}
extension AVLTree: CustomStringConvertible {
    var description: String {
        var s = ""
        if let root = root {
            s = horizontal(node: root, level: 0)
        }
        return s
    }
    
    private func horizontal(node: AVLNode<T>, level: Int) -> String {
        var s = ""
        if node.right != nil {
            s += horizontal(node: node.right!, level: level + 1)
        }
        s += "\n"
        for _ in 0..<level*4 {
            s += " "
        }
        s += "\(node.value)\n"
        if node.left != nil {
            s += horizontal(node: node.left!, level: level + 1)
        }
        return s
    }
}
