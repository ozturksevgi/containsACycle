//: Playground - noun: a place where people can play
// The project finds a node has a cycle

import UIKit

//Node Class
public class Node {
    var value: Int
    var next: Node!
    
    init(_ value: Int) {
        self.value = value
    }
}

//the func return pNode linked list has a cycle
public func containCycle(_ pNode: Node?) -> Bool {
    
    guard let node = pNode else {  //node nil control
        return false
    }
    
    guard let nextNode = node.next else { // one node situtation
        return false
    }
    
    var next = nextNode
    var visitedList: [Node] = []  //that list contain all visited nodes
    visitedList.append(next)
    
    while hasNext(next) {
        if visitedList.contains(where: {$0 === next.next}) {
            return true
        }
        next = next.next
    }
    return false
}

//return true node has a next node, otherwise false
func hasNext(_ pNode: Node?) -> Bool {
    guard let node = pNode else {
        return false
    }
    guard (node.next) != nil else {
        return false
    }
    return true
}

//sample nodes
var node1 = Node(1)
var node2 = Node(2)
var node3 = Node(3)
var node4 = Node(4)
var node5 = Node(5)

//create a cycle between node5 and node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node1

//call containCycle func with node1
containCycle(node1)
