import UIKit

//The prime factors of 13195 are 5, 7, 13 and 29. What is the largest prime factor of the number 600851475143 ?

var number = 600851475143

var largestPrime : Int = 1

for i in 2...number {
    while number % i == 0 {
        number /= i
        largestPrime = i
    }
}

print(largestPrime)
