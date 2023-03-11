import UIKit

var greeting = "Hello, playground"


class Node {
    var value : Int
    var next  : Node?
    
    init(_ value: Int, _ next: Node?) {
        self.value = value
        self.next  = next
    }
    
    func show() {
        print("[ value: \(value), next: \(next?.value)]")
    }
}

class LinkedList {
    var head : Node
    var tail : Node
    var length = 0
    
    init(value: Int) {
        head = Node(value, nil)
        tail = head
        length = 1
    }
    
    func append(_ value: Int) {
        let new = Node(value, nil)
        tail.next = new
        tail = new
        length += 1
    }
    
    func prepend(_ value: Int) {
        let new = Node(value, nil)
        new.next = head
        head     = new
        length += 1
    }
    
    func insert(_ value: Int, _ index: Int) {
        if index >= length {
            append(value)
            return
        } else if index <= 0 {
            prepend(value)
            return
        }
        
        let newNode = Node(value, nil)
        let leader = traversIndex(index-1)
        newNode.next = leader?.next
        leader?.next = newNode
        
    }
    
    func remove(_ index: Int) {
        
        if index == 0 {
            
            if length == 1 {
                head = Node(0, nil)
                tail = head
                length = 0
            } else {
                head = head.next!
                length -= 1
            }
            return
        }
        let leaderNode = traversIndex(index-1)
        let unwantedNode = leaderNode?.next
        leaderNode?.next = unwantedNode?.next
        length -= 1
    }
    
    func reverse() {
        guard head.next != nil else {
            return
        }
        var first = head
        tail = head
        var second = first.next
        while second != nil {
            let temp = second?.next
            second?.next = first
            first = second!
            second = temp
        }
        head.next = nil
        head = first
        
    }
    
    func traversIndex(_ index: Int) -> Node? {
        
        var count = 0
        var currentNode = head
        while count != index {
            guard let temp = currentNode.next else {
                return nil
            }
            currentNode = temp
            count += 1
        }
        
        return currentNode
    }
    
    func show() {
        var temp      : Node? = head
        var tempArray : [Int] = []
        
        while temp != nil {
            tempArray.append(temp!.value)
            //temp?.show()
            temp = temp?.next
        }
        print("Show: \(tempArray) Length: \(length)")
    }
}

//let myLinkedList = LinkedList(value: 4)
//myLinkedList.append(6)
//myLinkedList.append(9)
//myLinkedList.prepend(12)
//myLinkedList.insert(17, 10)
////myLinkedList.traversIndex(1)
//myLinkedList.show()
//
//myLinkedList.reverse()
////myLinkedList.remove(0)
//myLinkedList.show()



// Definition for singly-linked list.
public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    
}
class Solution {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        addTwoNumbersWidthCarry(l1, l2, 0)
    }
    
    func addTwoNumbersWidthCarry(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
        
        if l1 == nil && l2 == nil { return carry > 0 ? ListNode(carry) : nil }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
        return ListNode(sum < 10 ? sum : sum - 10, addTwoNumbersWidthCarry(l1?.next, l2?.next, sum < 10 ? 0 : 1))
    }
    
    static func show(_ node: ListNode?) {
        var current : ListNode? = node
        var array = [Int]()
        while current != nil {
            array.append(current!.val)
            current = current!.next
        }
        print(array)
    }
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        if list1 == nil  { return list2 }
        if list2 == nil  { return list1 }
        
        if list1!.val < list2!.val {
            return ListNode(list1!.val, mergeTwoLists(list1?.next, list2))
        } else {
            return ListNode(list2!.val, mergeTwoLists(list2?.next, list1))
        }
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        let node = ListNode(0)
        node.next = head
            
        var slow: ListNode? = node
        var fast: ListNode? = node
            
        for _ in 0..<n {
            guard let next = fast?.next else { continue }
            fast = next
        }
            
        while let fastNext = fast?.next, let slowNext = slow?.next {
            slow = slowNext
            fast = fastNext
        }
            
        slow!.next = slow!.next!.next
            
        return node.next
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            
        var temp = head
        while temp != nil {
            if temp?.val == temp?.next?.val {
                temp?.next = temp?.next?.next
            } else {
                temp = temp?.next
            }
        }
        
        return head
    }
    
    func deleteAllDuplicates(_ head: ListNode?) -> ListNode? {
        
        guard head?.next != nil else { return head }
                
        let startNode = ListNode(0)
        startNode.next = head
        var node = startNode
                
        while let nodeNext = node.next, nodeNext.next != nil {
            if nodeNext.val == nodeNext.next?.val {
                while nodeNext.val == node.next?.val {
                    node.next = node.next!.next
                }
            } else {
                node = nodeNext
            }
        }
        return startNode.next
    }
    
    //[1, 1, 1, 2, 3]
}

//let l1 = ListNode(2, ListNode(4, ListNode(3, nil)))
//let l2 = ListNode(5, ListNode(6, ListNode(4, nil)))
//
//let l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, nil)))))))
//let l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, nil))))
//
//Solution.show(Solution().addTwoNumbers(l1, l2))


//let l1 = ListNode(1, ListNode(2, ListNode(4, nil)))
//let l2 = ListNode(1, ListNode(3, ListNode(4, nil)))
//
//let l1 : ListNode? = nil
//let l2 = ListNode(0, nil)
//
//Solution.show(Solution().mergeTwoLists(l1, l2))


//let l1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))
////
////let l1 : ListNode? = nil
////
//Solution.show(Solution().removeNthFromEnd(l1, 2))


//let l1 = ListNode(1, ListNode(1, ListNode(1, nil)))
//
//let l1 = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3, nil)))))
//
//let l1 : ListNode? = nil
//
//Solution.show(Solution().deleteDuplicates(l1))


//let l1 = ListNode(1, ListNode(2, ListNode(3, ListNode(3, ListNode(4, ListNode(4, ListNode(5, nil)))))))
//
let l1 = ListNode(1, ListNode(1, ListNode(1, ListNode(2, ListNode(3, nil)))))
//
//let l1 : ListNode? = nil
//
Solution.show(Solution().deleteAllDuplicates(l1))




