import UIKit


func totalScoreOf(_ array: [Int]) -> Int {
    
    var score = 0
    for item in array {
    
        if item%2 == 0 {
            score += 1
        } else if item != 5 {
            score += 3
        } else {
            score += 5
        }
    }
    
    return score
}

//print("\(totalScoreOf([0,1,2,3,4,5,6,7,8,9,10,12])) expect: 24")
print("\(totalScoreOf([1,2,3,4,5,6,7,8,9,10])) expect: 30")
print("\(totalScoreOf([2,3,5,8,9])) expect: 12")
print("\(totalScoreOf([5,5,2,4,1,7,9])) expect: 22")
print("\(totalScoreOf([1,3,7])) expect: 9")
print("\(totalScoreOf([1,5,9])) expect: 8")

