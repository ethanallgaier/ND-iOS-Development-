/*:
## Exercise - Generic Functions
 
 The `duplicate` function below works only when working with Ints, but its body could work with any type. Rewrite the function to use a generic type `<T>` instead. Test your new function by calling it several times, using a String, an Int, and a Double.
 */

import Foundation
//OLD
func duplicate(_ int: Int) -> (Int, Int) {
    return (int, int)
}



//NEW
func duplicate2<T>(_ int: T) -> (T, T) {
    return (int, int)
}

var example = duplicate2("Hello")
var example2 = duplicate2(33)
var example3 = duplicate2(2.222)
//:  The function below retrieves a random value from an array of Ints and then deletes that value. The `inout` keyword means that it modifies the array passed into it directly. This function could work with an array of any type, so long as the type conforms to Equatable. Rewrite the function to use a generic type `<U>` instead, constraining to Equatable types. Test your new function by calling it several times, using an array of Strings, of Ints, and of Doubles.
//OLD
//func pullRandomElement(_ array: inout [Int]) -> Int? {
//    let randomElement = array.randomElement()
//    
//    guard let randomElement, let index = array.firstIndex(of: randomElement) else { return nil }
//    array.remove(at: index)
//    
//    return randomElement
//}


func pullRandomElement<U: Equatable>(_ array: inout [U]) -> U? {
    let randomElement = array.randomElement()
    
    guard let randomElement, let index = array.firstIndex(of: randomElement) else { return nil }
    array.remove(at: index)
    
    return randomElement
}
var number = [1, 1, 3]
var string = ["hello", "Jeifjb"]
var double = [1.1, 1.4, 2.22]

pullRandomElement(&number)
pullRandomElement(&string)
pullRandomElement(&double)




// & = I am passing this variable by reference, and yes, I accept the consequences.
//:  The function below sorts an array, then returns a new array containing only the first and last Strings of the array after sorting. This function could work with an array of any type, so long as the type conforms to Comparable. Rewrite the function to use a generic type `<V>` instead, constraining to Comparable types. Test your new function by calling it several times, using an array of Strings, of Ints, and of Doubles.

func minMaxArray<V: Comparable>(_ array: [V]) -> [V] {
    var output: [V] = []
    
    let minElement = array.min()
    let maxElement = array.max()
    
    if let minElement {
        output.append(minElement)
    }
    
    if let maxElement {
        output.append(maxElement)
    }
    
    return output
}

var number2 = [1, 4, 3, 7, 9, 10]
var string2 = ["hello", "Jeifjb", "the", "blah"]
var double2 = [1.1, 1.4, 2.22, 8.939, 9.9, 100.1]

minMaxArray(number2)
minMaxArray(string2)
minMaxArray(double2)
/*:
page 1 of 4  |  [Next: Exercise - Generic Types](@next)
 */
