//  🏔️ MTECH Code Challenge ND20: "Sum the Smallest"
//  Concept: Practice sorting and manipulating arrays.

//  Instructions:
    //  Create a function take that takes an Array<Int> and returns an Int
    //  The output of your function is the sum of the two smallest positive numbers in the array.
    //  If the array has too few positive integers, return nil.

//  Examples:
    //  Input: [19, 5, 42, 2, 77, -5]
    //  Output: 7

//  ⌺ Black Diamond Challenge:
    //  Extend the function to handle an additional optional parameter, another array of Ints called 'exclude'.
    //  The function should return the sum of the two smallest positive numbers in the array that are not in the 'exclude' array.
    //  If there are too few positive integers left after excluding the specified numbers, return nil.

import Foundation


func sumTheSmallest (numbers: [Int]) -> Int? {
    let positives = numbers.filter { $0 > 0 }.sorted()
        guard positives.count >= 2 else { return nil }
        return positives[0] + positives[1]
    
}


var example = sumTheSmallest(numbers: [19, 5, 42, 2, 77, -5])


