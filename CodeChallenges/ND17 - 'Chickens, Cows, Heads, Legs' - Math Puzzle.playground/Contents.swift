//  🏔️ MTECH Code Challenge ND17: "Chickens, Cows, Heads, Legs" 🐓🐄🗣️🦵
//  Concept: Solve unique math problems in Swift code

//  Instructions:
    //  Everybody has probably heard of the animal heads and legs problem from the earlier years at school. It goes:
        //  “A farm contains chickens and cows. There are x heads and y legs. How many chickens and cows are there?”
    //  where x <= 1000 and y <=1000

    //  Task
    //  Create a function that takes two integers as input, representing number of heads and legs.
    //  Assuming there are no other types of animals, work out how many of each animal are there.
    //  Return the amount in an Int array: [numberOfChickens, numberOfCows]
    //  If either the heads & legs is negative, the result of your calculation is negative, or the result is not a whole integer, return nil

//  Examples:
    //  Input: 72 heads, 200 legs
    //  Output: 44 chickens, 28 cows

    //  Input: 72 heads, 201 legs
    //  Output: nil (no solutions)

//  Notes:
    //  If 0 heads and 0 legs are given always return [0, 0] since zero heads must give zero animals.
    //  There are many different ways to solve this; you can use any as long as your formula correctly counts the number of animals.

//  ⌺ Black Diamond Challenge:
    //  Create another similar function. This time, add another Int parameter, numberOfSheep. 🐑
    //  Take into account how many sheep are mixed into the number of heads and legs, then return all three animal types, chickens, cows, and sheep in your calculation.
    //  If there are no valid solutions, return nil.

import Foundation
