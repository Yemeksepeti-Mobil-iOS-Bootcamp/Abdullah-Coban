import UIKit

/*
 
 Elimizde sadece harflerden oluşan (noktalama veya sayı yok) uzun stringler olsun. Bu stringlerin içinde bazı harflerin tekrar edeceğini düşünün. Mesela 'a' harfi 20 farklı yerde geçiyor. Bir fonksiyon ile verilen parametre değerine eşit ve daha fazla bulunan harfler silinecektir. Sonra geriye kalan string ekrana yazdırılacaktır.
 
 Örnek string: "aaba kouq bux"
 Tekrar sayısı 2 verildiğinde : a,b,u silinmeli ve ekrana "koq x" yazmalı
 Tekrar sayısı 3 verildiğinde : a silinmeli ve ekrana "b kouq bux"
 Tekrar sayısı 4 verildiğinde : 4 tane tekrarlayan harf olmadığı için aynı string yazdırılmalı
 
 NOT: String ve tekrar sayısını parametre olarak alsın. func(myString, count)
 */


func checkString(myString : String, count : Int) -> String {
    
    var characters = [Character:Int]()
    var newString = myString
    
    for item in newString.replacingOccurrences(of: " ", with: "") {
        var count = 1
        if characters.keys.contains(item) {
            count = characters[item]!
            characters.updateValue(count + 1, forKey: item)
        } else {
            characters[item] = count
        }
    }
    
    for char in characters {
        if char.value >= count {
            newString = newString.replacingOccurrences(of: String(char.key), with: "")
        }
    }
    
    return newString
    
}

checkString(myString: "aaba kouq bux", count: 2)
