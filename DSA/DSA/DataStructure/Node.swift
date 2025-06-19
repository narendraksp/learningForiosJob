//
//  Node.swift
//  DSA
//
//  Created by narendra kumar s on 21/03/25.
//

public class Node<Value>{
    var value:Value
    var next:Node?
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + ". "
    }
}
public class DoubleNode<Value>{
    var value:Value
    var next:DoubleNode?
    var prev:DoubleNode?
    init(value: Value, next: DoubleNode? = nil, prev: DoubleNode? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}
extension DoubleNode: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + ". "
    }
}
