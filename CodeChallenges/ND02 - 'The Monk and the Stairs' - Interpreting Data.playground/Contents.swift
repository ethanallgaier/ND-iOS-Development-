//  🏔️ MTECH Code Challenge ND02: "The Monk and the Stairs"
//  Concept: Practice evaluating large datasets

//  Instructions:
    //  Suzuki wanted to estimate how many stairs he will climb over 20 years. For a year, he recorded the number of stairs he took on a in a notebook with seven pages. On Monday, he turned to the Monday page, and added another entry of how many stairs he took that day, allowing him to easily compare to every previous Monday tally already on the page. He did the same for each day of the week. After one year, his notebook was finished.

    //  Create a function that takes an array of arrays of Ints as input, and returns an Int.
    //  Each subarray represents one day of the week (one page in Suzuki's notebook).
    //  Your function's returned Int should be an estimate of how many years he will climb in 20 years. (In other words, return the total number of stairs he climbed this year, multiplied by twenty.)

//  Notes:
    //  Regardless of how he organized them, fundamentally all you need to do is find the total number of steps he climbed that year and multiply it by twenty to estimate his twenty year total.

//  ⌺ Black Diamond Challenge:
    //  Suzuki wants to know which days of the week he climbed more stairs on average. Assuming the input array's contents are organized as [sunday, monday, tuesday, wednesday, thursday, friday, saturday], find the average number of stairs climbed for each day, then output a string of the weekdays, presenting them in order highest to lowest average (i.e. "tuesday, friday, wednesday, thursday, monday, saturday, sunday")

import Foundation
