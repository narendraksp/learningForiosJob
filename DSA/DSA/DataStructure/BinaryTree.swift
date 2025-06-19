//
//  BinaryTree.swift
//  DSA
//
//  Created by narendra kumar s on 31/03/25.
//

class TreeNode<Value>{
    var value:Value
    var left:TreeNode?
    var right:TreeNode?
    init(value:Value, left:TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
        
    }
}

struct BinaryTree<Element>  where Element : Comparable{
    var root : TreeNode<Element>?
    init(root:TreeNode<Element>? = nil) {
        self.root = root
    }
    mutating func Inset(_ value: Element) {
        let newTree = TreeNode(value: value)
        if let root = root {
            self.insersetHelper(node: root, newTree: newTree)
        } else {
            root = newTree
        }
    }
    mutating func search( _ value: Element)-> Bool {
        searchHelper(root, value: value)
    }
    
    
    
    func deleteNode(_ root: TreeNode<Element>?, _ key: Element) -> TreeNode<Element>? {
            // case 1: root is nil
        guard let root = root else { return nil }
        
        if root.value == key {
                // case 2: root is a leaf node
            if root.left == nil && root.right == nil {
                return nil
            }
            
                // case 3: root has only right child
            if root.left == nil && root.right != nil {
                return root.right
            }
            
                // case 4: root has only left child
            if root.left != nil && root.right == nil {
                return root.left
            }
            
                // case 5: root has both left and right child, we put the left child to the left leaf of right child
            var cur: TreeNode? = root.right   // to find the left leaf of right child
            while cur?.left != nil {
                cur = cur?.left
            }
            
            cur?.left = root.left   // put the left child to the left leaf of right child
            return root.right
        }
        
        if root.value > key {
            root.left = deleteNode(root.left, key)
        }
        
        if root.value < key {
            root.right = deleteNode(root.right, key)
        }
        
        return root
    }
    mutating func searchHelper( _ tree:TreeNode<Element>?, value: Element) -> Bool {
        guard let tree = tree else { return false }
        if tree.value == value {
            return true
        } else {
            if value < tree.value {
                return searchHelper(tree.left, value: value)
            }else {
                return  searchHelper(tree.right, value: value)
            }
        }
    }
    mutating func delete(_ value: Element) {
        root = delete(from: root, value: value)
    }
    private func delete(from node: TreeNode<Element>?, value: Element) -> TreeNode<Element>? {
        guard let node = node else {
            return nil
        }
        print("node value \(node.value)")
        print(" value \(value)")

        if value == node.value {
                // Node with only one child or no child
            if node.left == nil {
                return node.right
            } else if node.right == nil {
                return node.left
            }
            print(node.value)
            
                // Node with two children: get the inorder successor
            node.value = minValue(node.right!)
            print("node means\(node.value)")
          
                // Delete the inorder successor
            node.right = delete(from: node.right, value: node.value)
        } else if value < node.value {
            node.left = delete(from: node.left, value: value)
        } else {
            node.right = delete(from: node.right, value: value)
        }
        
        return node
    }
    private func minValue(_ node: TreeNode<Element>) -> Element {
        var current = node
        while let next = current.left {
            current = next
        }
        print(" means\(current.value)")

        return current.value
    }
    
    mutating   func  insersetHelper( node:TreeNode<Element>, newTree:TreeNode<Element>){
        if newTree.value < node.value  {
            if let leftNode = node.left {
                insersetHelper(node: leftNode, newTree: newTree)
            } else {
                node.left  = newTree
            }
        } else {
            if let rightTree = node.right {
                self.insersetHelper(node: rightTree, newTree: newTree)
            } else {
                node.right = newTree
            }
        }
    }
    private func inorderHelper(node: TreeNode<Element>?) {
        guard let node = node else { return }
        print(node.value, terminator: " ")
        
        inorderHelper(node: node.left)
        inorderHelper(node: node.right)
        
    }
    func preorderTraversal() {
        inorderHelper(node: root)
    }
    
}
