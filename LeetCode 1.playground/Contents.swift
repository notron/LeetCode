var calculat = 0

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var temp : [Int: Int] = [:]
    
    for (i,num) in nums.enumerated() {
        if let current = temp[target-num] {
            return [current, i]
        }
        temp[num] = i
    }
    return []
}
//print(twoSum([-3,4,3,90], 0))

func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var res: [[Int]] = []
        let sorted = nums.sorted()
        var i = 0
        
        while i < sorted.count - 2 {
            if i > 0, sorted[i] == sorted[i - 1] {
                i += 1
                continue
            }
            
            var j = i + 1
            var k = sorted.count - 1
            
            while j < k {
                let target = sorted[i] + sorted[j] + sorted[k]
                if (target == 0) {
                    if j - 1 > i, sorted[j] == sorted[j - 1] {
                        j += 1
                        continue
                    }
                    res.append([sorted[i], sorted[j], sorted[k]])
                    j += 1
                } else if (target < 0) {
                    j += 1
                } else {
                    k -= 1
                }
            }
            i += 1
        }
        
        return res
    }
print("Target: [[-1,-1,2],[-1,0,1]] , result: \(threeSum([-1,0,1,2,-1,-4]))")
print("Target: [] , result: \(threeSum([]))")
print("Target: [] , result: \(threeSum([0]))")
print("Target: [[0,0,0]] , result: \(threeSum([0,0,0,0]))")
print("Target: [[-1,0,1]] , result: \(threeSum([-1,0,1,0]))")


func isPalindrome(_ x: Int) -> Bool {
    
    let string = "\(x)"
    var temp = ""
    
    for char in string {
        if let num = Int("\(char)") {
            temp = "\(num)" + temp
        }
    }
    if Int(temp) == x {
        return true
    }
    return false
}
//print(isPalindrome(1212121))

func romanToInt(_ s: String) -> Int {
    
    var previous : Character = " "
    var sum = 0
    
    let symbols : [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000,
    ]
    
    for char in s {

        if previous == "I" && (char == "V" || char == "X") {
            sum += (symbols[char]! - 2 * (symbols[previous]!))
        } else if previous == "X" && (char == "L" || char == "C") {
            sum += (symbols[char]! - 2 * (symbols[previous]!))
        } else if previous == "C" && (char == "D" || char == "M") {
            sum += (symbols[char]! - 2 * (symbols[previous]!))
        } else {
            sum += symbols[char] ?? 0
        }
        previous = char
    }
    
    return sum
}
//print("Target: 3    , result: \(romanToInt("III"))")
//print("Target: 58   , result: \(romanToInt("LVIII"))")
//print("Target: 1994 , result: \(romanToInt("MCMXCIV"))")

func intToRoman(_ num: Int) -> String {
    
    var symbols = [symbol]()
    
    class symbol {
        let key : String
        let value : Int
        
        init(key: String, value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    symbols.append(symbol(key: "M" , value: 1000))
    symbols.append(symbol(key: "CM", value: 900))
    symbols.append(symbol(key: "D" , value: 500))
    symbols.append(symbol(key: "CD", value: 400))
    symbols.append(symbol(key: "C" , value: 100))
    symbols.append(symbol(key: "XC", value: 90))
    symbols.append(symbol(key: "L" , value: 50))
    symbols.append(symbol(key: "XL", value: 40))
    symbols.append(symbol(key: "X" , value: 10))
    symbols.append(symbol(key: "IX", value: 9))
    symbols.append(symbol(key: "V" , value: 5))
    symbols.append(symbol(key: "IV", value: 4))
    symbols.append(symbol(key: "I" , value: 1))
    
    func appendSTR(_ str: inout String, _ char: String, _ count: Int) {
        if count > 0 {
            for _ in 1 ... count {
                str += char
            }
        }
    }
    
    var temp = num
    var str = ""
    
    for symbol in symbols {
        if temp >= symbol.value {
            let count = temp/symbol.value
            temp -= symbol.value * count
            appendSTR(&str, symbol.key, count)
        }
    }
    
    return str
}
//print("Target: III     , result: \(intToRoman(3))")
//print("Target: LVIII   , result: \(intToRoman(58))")
//print("Target: MCMXCIV , result: \(intToRoman(1994))")



 //Definition for singly-linked list.
 public class ListNode {
     
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
      
}
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
    }
}
