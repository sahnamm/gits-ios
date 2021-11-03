import UIKit

var greeting = "SAHNA MELLY MARSELINA"
print(greeting)
print()

//MARK: SOAL 1
var array1 = [1,1,0,1,1,1]
var array2 = [1,0,0,1,0,1,1]
var array3 = [0,0,0]
var array4 = [1,1,1,1,0,1,1,0,1]

func maxNumberOfConsecutive(_ array: [Int]) -> Int {
    var temp = 0
    var total = [Int]()

    if(!array.isEmpty || array.count <= 10000){
        for value in array {

            if value == 1 {
                temp += 1
            } else {
                if temp > 0 {
                    //take note total of 1 before meet 0
                    total.append(temp)
                }
                temp = 0 //reset temp
            }
        }

        total.append(temp) //to handle input total when last value is 1
    }

    return total.max() ?? 0 //return 0 if array is null
}
print("============================")
print("JAWABAN SOAL NO 1")
print("============================")
print("\(array1) => \(maxNumberOfConsecutive(array1))")
print("\(array2) => \(maxNumberOfConsecutive(array2))")
print("\(array3) => \(maxNumberOfConsecutive(array3))")
print("\(array4) => \(maxNumberOfConsecutive(array4))")
print()

//MARK: SOAL 2
var array5 = ["h","e","l","l","o"]
var array6 = ["w","e","l","c","o","m", "e"]

func reverseRecursive(_ array: [String]) -> [String] {
    guard let last = array.last else {
        fatalError("Index out of range")
    }

    if array.count == 1 {
        return Array(arrayLiteral: last)
    } else {
        return Array(arrayLiteral: last) + reverseRecursive(Array(array[0..<array.count-1]))
    }
}

print("============================")
print("JAWABAN SOAL NO 2")
print("============================")
print("\(array5) => \(reverseRecursive(array5))")
print("\(array6) => \(reverseRecursive(array6))")
print()

//MARK: SOAL 3
let string1 = "{[()]}"
let string2 = "{[(])}"
let string3 = "{(([])[])[]}"
let string4 = "{()"
let string5 = "}()"
let string6 = ""

func findBalancedBracket(_ word: String) -> String {
    var result = true

    if word.isEmpty {
        //handle empty string
        result = false
    } else {
        var enclosings = [Character]()
        let dict: [Character: Character] = [
            "{" : "}",
            "[" : "]",
            "(" : ")",
        ]

        for value in word.trimmingCharacters(in: .whitespacesAndNewlines) {
            if let enclosing = dict[value] {
                //only keyword accepted
                enclosings.append(enclosing)
            } else if let expectedEnclosing = enclosings.last {
                if value == expectedEnclosing {
                    //expected enclose found
                    _ = enclosings.removeLast()
                } else {
                    //not the expected enclose, terminate loop
                    result = false
                    break
                }
            } else {
                //not in the list of keyword
                result = false
                break
            }
        }

        if(!enclosings.isEmpty){
            //length of string is odd
            result = false
        }
    }

    return result ? "YES" : "NO"
}

print("============================")
print("JAWABAN SOAL NO 3")
print("============================")
print("\(string1) => \(findBalancedBracket(string1))")
print("\(string2) => \(findBalancedBracket(string2))")
print("\(string3) => \(findBalancedBracket(string3))")
print("\(string4) => \(findBalancedBracket(string4))")
print("\(string5) => \(findBalancedBracket(string5))")
print("\(string6) => \(findBalancedBracket(string6))")
