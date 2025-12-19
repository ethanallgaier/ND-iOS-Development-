//  🏔️ MTECH Code Challenge ND16: "Punctuation Removal"
//  Concept: Practice manipulating a string

//  Instructions:
    //  Remove any punctuation mark from the end of a string.
    //  If the string ends with a punctuation mark (e.g., '.', ',', '!', '?', ';', ':', '-', '_'), remove only the last occurrence of such a mark.
    //  If the input string is empty, return an empty string.

//  Examples:
    //  Input: "Greetings, friends!!"
    //  Output: "Greetings, friends!"

    //  Input: "Wow."
    //  Output: "Wow"

//  ⌺ Black Diamond Challenge:
    //  Create another function. This time, remove all leading and trailing punctuation, including multiples.
    //  Input: "...This is a good example!!!", Output: "This is a good example"

import Foundation


func puncRemoval(_ input: String) -> String {
   
    guard !input.isEmpty else {//Check if string is empty
        return "" // if it is return empty string
    }
    
    let punctuation: Set<Character> = [".", "!", "?", ";", ":", "-", "_"]
    
    //checjh if the last character is a punc
    if punctuation.contains(input) {
        return String(input.dropLast())//remove the last one
    }
    
  return input
    
}

 puncRemoval("Greetings, friends!!")
 puncRemoval("Greetings, friends!!?")






func removePunc(from input: String ) -> String  {
    var returnString = input
    //mutating returnString
    if returnString.last?.isPunctuation == true {
        returnString.removeLast()//returns string with removed punc
        
    }
    return String(returnString)
    
}

removePunc(from: "Hello, world!??")
