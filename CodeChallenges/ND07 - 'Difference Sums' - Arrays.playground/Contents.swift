//  🏔️ MTECH Code Challenge ND07: "Difference Sums"
//  Concept: Practice sorting arrays and performing mathematical operations on them

//  Instructions:
    //  Create a function that takes an array of integers as input and returns an integer.
    //  Your task is to sum the differences between consecutive pairs. Find the absolute difference between each consecutive pair in the array (e.g., if the order is 2, 10, then the absolute difference would be 8, instead of the normal difference, -8.) Output the sum of the absolute differences.

//  Examples:
    //  Input: [2, 1, 10]
    //  Logic:
        //  Find differences: 2 - 1 = 1, 1 - 10 = -9 (so absolute difference is 9)
        //  Sum differences: 1 + 9 = 10
    //  Output: 10

//  Notes:
    //  If the array is empty or only has one element, the result should be 0.

//  ⌺ Black Diamond Challenge:
    //  Calculate and return the average difference as well.

import Foundation

func differenceSums(input: [Int]) -> Int {
    if input.isEmpty || input.count == 1 {
        return 0
    }
    
   var firstResult = input[0] - input[1]
    var secondResult = input[1] - input[2]
    
    if secondResult < 0 {
        secondResult = -secondResult
    }
    
    var finalResults = firstResult + secondResult
    return finalResults
    
}


var example = [2, 1,10]
print(differenceSums(input: example))


