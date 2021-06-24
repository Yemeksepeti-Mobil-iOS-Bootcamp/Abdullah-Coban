import UIKit

//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

var total = 1

for num2 in 1...20 {
    total = (total * num2) / Divisor(number1: total, number2: num2)
}

func Divisor(number1: Int, number2: Int) -> Int {

    let r = number1 % number2
    if r != 0 {
        return Divisor(number1: number2, number2: r)
    } else {
        return number2
    }
}

print(total)


