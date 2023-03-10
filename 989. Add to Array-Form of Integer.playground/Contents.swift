import Foundation

class Solution {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        
        let arrayK = "\(k)".compactMap(\.wholeNumberValue)
        //print(arrayK)
        var result = [Int]()
        var second = [Int]()
        var carry : Int?

        if num.count >= arrayK.count {
            result = num
            second = arrayK
        } else {
            result = arrayK
            second = num
        }
        
        for i in stride(from: result.count-1, to: -1, by: -1) {

            var temp = result[i] + (carry ?? 0)
            
            if second.count > 0 {
                temp = result[i] + second.removeLast() + (carry ?? 0)
            }

            if temp >= 10 {
                carry = 1
                result[i] = temp-10
            } else {
                result[i] = temp
                carry = nil
            }
        }
        
        if carry != nil {
            result.insert(1, at: 0)
        }
        
        return result
    }
}

print("\(Solution().addToArrayForm([1,2,0,0], 34)) expect: [1,2,3,4]")
print("\(Solution().addToArrayForm([2,7,4], 181)) expect: [4,5,5]")
print("\(Solution().addToArrayForm([2,1,5], 806)) expect: [1,0,2,1]")
