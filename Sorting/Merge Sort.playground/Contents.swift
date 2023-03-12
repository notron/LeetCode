import UIKit

func mergeSort(numbers: [Int]) -> [Int] {
    
    if numbers.count == 1 {
        return numbers
    }
    
    let count = numbers.count
    let middle = count / 2
    let left = Array(numbers[0..<middle])
    let right = Array(numbers[middle...])
    print("left: \(left)")
    print("right: \(right)")
    
    //return []
    return merge(mergeSort(numbers: left), mergeSort(numbers: right))
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

let numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0]
print(mergeSort(numbers: numbers))

let numbers2 = [5,1,1,2,0,0]
print(mergeSort(numbers: numbers2))




