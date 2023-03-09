import UIKit

class Solution {
    
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        
        var right = 1
        var left = piles.max()!

        while left <= right {

            let mid = (left + right) / 2
            let curH = piles.reduce(0, { $0 + ($1 + mid - 1) / mid })

            if curH <= h {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        return left
    }
}

print("\(Solution().minEatingSpeed([3,6,7,11], 8)) - expect: 4")

print("\(Solution().minEatingSpeed([30,11,23,4,20], 5)) - expect: 30")

print("\(Solution().minEatingSpeed([30,11,23,4,20], 6)) - expect: 23")
