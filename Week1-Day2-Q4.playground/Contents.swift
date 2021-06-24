import UIKit

//A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest palindrome made from the product of two 3-digit numbers.

var product = 0
var largestPalindrome : Int = 0
var result = 0

func findPalindromeNumber() {

for left in stride(from: 999, to: 100, by: -1) {
    for right in stride(from: left, to: 100, by: -1) {
        product = left * right
        
        let productStr = String(product)
        let revProductStr = String(productStr.reversed())
        
        if productStr == revProductStr {
            
            if product > result {
                result = product
                break
            }
        }
    }
}

print(result)

}

findPalindromeNumber()

