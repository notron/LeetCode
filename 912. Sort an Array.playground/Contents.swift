import UIKit

class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        
        if nums.count == 1 {
            return nums
        }
        
        let count = nums.count
        let middle = count / 2
        let left = Array(nums[0..<middle])
        let right = Array(nums[middle...])

        return merge(sortArray(left), sortArray(right))
    }
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        
        var result = [Int]()
        var leftIndex = 0
        var rightIndex = 0
        
        while (leftIndex < left.count && rightIndex < right.count) {
            
            if left[leftIndex] < right[rightIndex] {
                result.append(left[leftIndex])
                leftIndex += 1
            } else {
                result.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        result.append(contentsOf: Array(left[leftIndex...]))
        result.append(contentsOf: Array(right[rightIndex...]))

        return result
    }
}


print(Solution().sortArray([5,2,3,1]))
