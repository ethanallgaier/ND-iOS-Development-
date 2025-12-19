//  🏔️ MTECH Code Challenge ND18: "Area Perimter"
//  Concept: Practice a simple math warmup

//  Instructions:
    //  You are given the length and width of a 4-sided polygon. The polygon can either be a rectangle or a square.
    //  If it is a square, return its area. If it is a rectangle, return its perimeter.

//  Examples:
    //  Input: 5, 5
    //  Logic: Square, area is length * width, so 5 * 5
    //  Output: 25

    //  Input: 10, 5
    //  Logic: Rectangle, perimeter is 2(length) + 2(width)
    //  Output: 30

//  ⌺ Black Diamond Challenge:
    //  Create a new function that takes three lengths for the three sides of a triangle. Calculate and return its perimeter and its area.

import Foundation




func areaPerimter(length: Double, width: Double) -> Double {
    
    if length == width {       //square
        var area: Double = (length * width)
        return area
    }else {                    // Rectangle
        var Perimter: Double = (2 * length) + (2 * width)
        return Perimter
    }
    
}
print(areaPerimter(length: 5, width: 5))
print(areaPerimter(length: 10, width: 5))
