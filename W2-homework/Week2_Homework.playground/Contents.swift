import UIKit

//ÖDEV: Girilen bir sayının asal olup olmadığını bulan bir extension yazınız
 
extension Int {
    
    func isPrime() -> String {
        
        var count: Int = 0
        
        if self <= 1 {
            return "\(self) is not Prime."
        }
        
        if self <= 3 {
            return "\(self) is Prime."
        }
        
        for n in 2...self {
            if self % n == 0 {
                count += 1
            }
        }
        
        if count == 1 {
            return "\(self) is Prime."
        } else {
            return "\(self) is not Prime."
        }
    }
}

//ÖDEV: İki parametreli ve FARKLI tipli bir generic örneği yapınız. (T, U) ???





//Project Euler - Q6

/*
 
 The sum of the squares of the first ten natural numbers is, 1^2 + 2^2 + ... + 10^2 = 385
 The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)^2 = 3025
 Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 
 */


func SumOfSquare(count: Int) -> Int {
    
    var sum: Int = 0
    
    for n in 1...count {
        sum += n*n
    }
    
    return sum
}


func SquareOfSum(count: Int) -> Int {
    
    var sum: Int = 0
    
    for n in 1...count {
        sum += n
    }
    
    return sum * sum
}

func Diff(count: Int) -> Int {
    let sumOfSquare = SumOfSquare(count: count)
    let squareOfSum = SquareOfSum(count: count)
    
    return squareOfSum - sumOfSquare
}

Diff(count: 100)


//Project-Euler Q7

/*
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 What is the 10 001st prime number?
 */

func isPrime(number: Int) -> Bool {
    
    
    var count: Int = 0
    
    if number <= 1 {
        return false
    }
    
    if number <= 3 {
        return true
    }
    
    for n in 2...number {
        if number % n == 0 {
            count += 1
        }
    }
    
    if count == 1 {
        return true
    } else {
        return false
    }
}


func FindPrime(times: Int) -> Int {
    
    var count = 1
    var number = 0
    
    while count <= times {
        number += 1
        if isPrime(number: number) {
            count += 1
        }
    }
    
    return number
}


FindPrime(times: 10001)

