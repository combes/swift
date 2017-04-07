/*
 Problem 1
 
 If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
 
 Find the sum of all the multiples of 3 or 5 below 1000.
 */

/// Find sum of all multiples of 3 or 5.
///
/// - Parameter max: Maximum value
/// - Returns: Sum of all multiples
func findSumAllMultiples(max: Int) -> Int {
    
    let array = Array(1..<max)
    return array.filter { $0 % 3 == 0 || $0 % 5 == 0 }.reduce(0, { x, y in x + y } )
    
//    var sum = 0
//    
//    // Natural numbers are the counting numbers as 1, 2, 3, etc.
//    for i in 1..<max {
//        if i % 3 == 0 || i % 5 == 0 {
//            sum += i
//        }
//    }
//    
//    return sum
}

assert(findSumAllMultiples(max: 1000) == 233168)
