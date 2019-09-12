import UIKit
//i.
func square(number: Int) -> Int {
    return number * number
}
//ii.
func five() -> Int {
    return 5
}
//iii.
func fullName(first: String, last: String) -> String {
    return first + " " + last
}
//iv.
func shout(sentence: String) -> String {
    return sentence + "!"
}
//v.
func numberName(spell num: Int) -> String {
    
    let numberSpelled: [String] = ["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine"]
    if (-1 < num && num < 10) {
        return numberSpelled[num]
    }else{
        return "nil"
    }
}



print(square(number: 3))
print(five())
print(fullName(first: "Kadin", last: "Mesriani"))
print(shout(sentence: "I love Computer Science"))
print(numberName(spell: 9))
print(numberName(spell: 13))


