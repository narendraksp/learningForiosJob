//
//  Queue.swift
//  DSA
//
//  Created by narendra kumar s on 26/03/25.
//
//// with array
struct Queue<Element> {
    
    var elements: [Element] = []
    init(){
        
    }
    var isEmpty: Bool {
        elements.isEmpty
    }
    mutating func Dequee() -> Element? {
        isEmpty ? nil: elements.removeFirst()
    }
    
    mutating func quue(_ value: Element) {
        self.elements.append(value)
    }
    
}

/// with linded list
///
struct QueueLinkedList<Vlaue> {
    var head: Node<Vlaue>?
    var tail: Node<Vlaue>?
    init() {}
    
    var isEmapty: Bool {
        head == nil
    }
    
    public mutating func queed( _ value: Vlaue) {
        if isEmapty {
            head =  Node(value: value, next: head)
            tail = head
        } else {
            tail?.next = Node(value: value)
            tail = tail?.next
        }
    }
    
    public mutating func dequeue() -> Vlaue? {
        defer {
            head = head?.next
            if isEmapty {
                tail = nil
            }
            
        }
        return head?.value
    }
}

