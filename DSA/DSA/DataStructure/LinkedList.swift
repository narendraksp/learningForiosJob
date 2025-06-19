//
//  LinkedList.swift
//  DSA
//
//  Created by narendra kumar s on 21/03/25.
//

public struct LinkedList<Value> {
    var head :Node<Value>?
    var tail:Node<Value>?
    init() {

    }
    public var isEmpty:Bool{
        return head == nil
    }
    mutating func push(_ value:Value) {
        
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    
    
    public mutating func append(_ value: Value) {
        
            // 1
        guard !isEmpty else {
            push(value)
            return
        }
 
            // 2
        tail!.next = Node(value: value)
            // 3
    
        tail = tail!.next
        

    }
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    public func node(at index:Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        while currentIndex < index  && currentNode != nil{
            currentNode = currentNode?.next
            currentIndex += 1
            
            
        }
        return currentNode
    }
    
    public mutating func insert(_ value: Value,
                                after node: Node<Value>)
    -> Node<Value> {
            // 2
        guard tail !== node else {
            print("fdfd")
            append(value)
            return tail!
        }
            // 3
        node.next = Node(value: value, next: node.next)
        print("change")
        return node.next!
    }

    public mutating func removeLast() -> Value? {
            // 1
        guard let head = head else {
            return nil
        }
        print(head.next?.value)
            // 2
        guard head.next != nil else {
            return pop()
        }
            // 3
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
            // 4
        prev.next = nil
        tail = prev
        return current.value
    }


}
extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        
        return String(describing: head)
    }
}

struct DoubleLinkedList<Value>{
    var head: DoubleNode<Value>?
    var tail: DoubleNode<Value>?
    init() {}
    
    public var isEmpty:Bool{
        return head == nil
    }
    
    mutating func push( _ value: Value){
        if isEmpty {
            head = DoubleNode(value: value)
            tail = head
            
            
        } else {
            
            head?.prev = DoubleNode(value: value, next: head)
            head = head?.prev
        }
        
        
    }
    
    mutating func append( _ value: Value) {
        
        guard !isEmpty else {
            print("sfsf")
            push(value)
            return
        }
        tail?.next = DoubleNode( value:value, prev:tail)
        tail = tail?.next
        
    }
    
    mutating func pop() ->Value? {
        defer{
            if !isEmpty {
                head = head?.next
                head?.prev = nil
            }
        }
        return isEmpty ? nil : head?.value
    }
    mutating func removeLast() -> Value? {
        defer {
            tail =  tail?.prev
            tail?.next = nil
        }
        return tail?.value
    }
    
}
extension DoubleLinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        
        return String(describing: head)
    }
}
