import UIKit

/*
Elinizde uzun bir cümle olsun, bazı kelimeler tekrar eddecek bir cümle düşünün. İstediğimiz ise, hangi kelimeden kaç tane kullanıldığını bulmanız.
 string = "merhaba nasılsınız. iyiym siz nasılsınız. bende iyiyim."
 */

func checkWords (myString: String) {
    
    var words = [String:Int]()
    var sentence = myString
    
    let sentenceArr = sentence.replacingOccurrences(of: ".", with: "").components(separatedBy: " ")
    
    for word in sentenceArr {
        var count = 1
        if words.keys.contains(word) {
            count = words[word]!
            words.updateValue(count + 1, forKey: word)
        } else {
            words[word] = count
        }
    }
    
    print(words)
}

checkWords(myString: "merhaba nasılsınız. iyiyim siz nasılsınız. ben de iyiyim. nasılsınız iyi mi güzel merhaba")

