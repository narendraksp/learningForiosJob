import UIKit

////var wordList = Trie(from: ["hello", "world", "swift", "trie", "help"])
//class TrieNode {
//    var children: [Character: TrieNode] = [:]
//    var isEndOfWord = false
//}
//
//struct Tries{
//    let root = TrieNode()
//    func insert(_ string:String) {
//        var currenr = root
//        for char in string.lowercased() {
//            if currenr.children[char] == nil {
//                currenr.children[char] = TrieNode()
//            }
//            currenr = currenr.children[char]!
//        }
//        currenr.isEndOfWord = true
//        
//    }
//    
//    func starting(prefix:String) -> [String] {
//        var currenr = root
//        for char in prefix {
//            guard let next = currenr.children[char] else {
//                return []
//            }
//            currenr = next
//        }
//        var results: [String] = []
//         collectWords(node: currenr, prefix: prefix, result: &results)
//        return results
//    }
//    
//    
//    func collectWords(node:TrieNode, prefix:String, result:inout [String]){
//        
//        if node.isEndOfWord == true {
//            result.append(prefix)
//        }
//        for (char, childnode) in node.children {
//            let prfix  = prefix + String(char)
//            
//            collectWords(node:childnode , prefix: prfix, result: &result)
//        }
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//class Trie {
//    private let root = TrieNode()
//    
//    func insert(_ word: String) {
//        var current = root
//        for char in word {
//            if current.children[char] == nil {
//                current.children[char] = TrieNode()
//            }
//            current = current.children[char]!
//        }
//        current.isEndOfWord = true
//    }
//    
//    func startsWith(_ prefix: String) -> Bool {
//        var current = root
//        for char in prefix {
//            guard let nextNode = current.children[char] else {
//                return false
//            }
//            current = nextNode
//        }
//        return true
//    }
//    
//    func wordsWithPrefix(_ prefix: String) -> [String] {
//        var current = root
//        for char in prefix {
//            guard let nextNode = current.children[char] else {
//                return []
//            }
//            current = nextNode
//        }
//        
//        var results: [String] = []
//        collectWords(node: current, prefix: prefix, results: &results)
//        return results
//    }
//    
//    private func collectWords(node: TrieNode, prefix: String, results: inout [String]) {
//        if node.isEndOfWord {
//            results.append(prefix)
//        }
//        for (char, childNode) in node.children {
//            collectWords(node: childNode, prefix: prefix + String(char), results: &results)
//        }
//    }
//}
//
//
//var triObj = Tries()
//triObj.insert("apple")
//triObj.insert("application")
//triObj.insert("apps")
//triObj.insert("apuna")
//triObj.insert("abc")
//triObj.insert("qabc")
//triObj.starting(prefix: "")

    // MARK: - Vertex

struct Vertex<T: Hashable>: Hashable {
    var value:T
    init(value: T) {
        self.value = value
    }
}
struct Edge<T: Hashable>: Hashable{
    var from:Vertex<T>
    var to:Vertex<T>
    let weight: Double?

}
class AdjacencyListGraph<T: Hashable>  {
    var adjacencyList:[Vertex<T> : [Edge<T>]] = [:]
    func addVertex(value:T) -> Vertex<T>{
        
        let vertex = Vertex(value: value)
        if adjacencyList[vertex] == nil {
            adjacencyList[vertex] = []
        }
        return vertex
    }
    func addDirrect(from:Vertex<T>,to:Vertex<T>, wight:Double? = nil) {
        let endge = Edge(from: from, to: to, weight: wight)
        adjacencyList[from, default: []].append(endge)
        
    }
    func addUndirect(from:Vertex<T>,to:Vertex<T>,wieght:Double? = nil){
        addDirrect(from: from, to: to, wight: wieght)
        addDirrect(from: to, to: from, wight: wieght)

    }
    func edges(from vertex: Vertex<T>) -> [Edge<T>] {
        return adjacencyList[vertex] ?? []
    }
    func printGraph() {
        for (vertex, edges) in adjacencyList {
            let edgeDescriptions = edges.map { "\($0.to.value)(w:\($0.weight ?? 0))" }.joined(separator: ", ")
            print("\(vertex.value) -> [\(edgeDescriptions)]")
        }
    }
}
var grph = AdjacencyListGraph<Int>()
let three = grph.addVertex(value: 3)
let four = grph.addVertex(value: 4)
let five = grph.addVertex(value: 5)
let six = grph.addVertex(value: 6)
grph.addDirrect(from: three, to: four)
grph.addUndirect(from: five, to: four)
grph.addUndirect(from: three, to: four)
grph.printGraph()
