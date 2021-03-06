import UIKit

// This is a function that returns a String? (or Optional<String>). You'll use it below.
func getFirstVowel(in name: String) -> String? {
    let vowels: [Character] = ["a", "e", "i", "o", "u", "y"]
    for char in name {
        if vowels.contains(char) {
            return String(char)
        }
    }
    return nil
}

// TODO: Change yourName to your name.
let yourName = "Kadin"

let firstVowel = getFirstVowel(in: yourName)

// TODO: Assign the underlying value of firstVowel to unwrappedVowelOne, unwrappedVowelTwo, and unwrappedVowelThree. Use a different method of unwrapping firstVowel each time.
// v-- Insert code below here --v
var unwrappedVowelOne: String
if let unwrapped = getFirstVowel(in: yourName) {
    unwrappedVowelOne = unwrapped
} else {
    unwrappedVowelOne = "There were no English vowels in your name"
}
//var unwrappedVowelTwo: String

let unwrappedVowelTwo: String = (getFirstVowel(in: yourName) ?? "There were no English vowels in your name again")

var unwrappedVowelThree: String = firstVowel!


// ^-- Insert code above here --^
print("The first vowel in '\(yourName)' is '\(unwrappedVowelOne)'.")
print("The first vowel in '\(yourName)' is '\(unwrappedVowelTwo)'.")
print("The first vowel in '\(yourName)' is '\(unwrappedVowelThree)'.")
