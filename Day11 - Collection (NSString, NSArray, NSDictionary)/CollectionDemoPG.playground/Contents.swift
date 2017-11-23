//: Playground - noun: a place where people can play

import UIKit

// 4.1
var arr1: [Int] = []
var arr2: Array<Int> = Array<Int>()
var arr3 = Array<Int>()
var arr4: Array<Int> = []

//4.2
var arr5: [Int] = [4, 8, 15, 16, 23, 42]
var arr6: Array<Int> = Array<Int>(arrayLiteral: 4, 8, 15, 16, 23, 42)
var arr7 =  Array<Int>(arrayLiteral: 4, 8, 15, 16, 23, 42)
var arr8: Array<Int> = [4, 8, 15, 16, 23, 42]

//4.3 -> Use keyword let when initial array

//4.4 -> User append() method to add more elements at the end.

//4.5 -> arr8[2] = 17

//4.7
var arr9: Array<String> = Array<String>(repeating: "🐑", count: 10)

//4.8 -> arr8.removeLast()


// SET
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮","🐶", "🐔", "🐑",  "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
cityAnimals.isDisjoint(with: farmAnimals)
let newSet = farmAnimals.subtracting(houseAnimals)
let unionSet = farmAnimals.union(houseAnimals).union(cityAnimals)

// Dictionary
var secretIdentities = ["Hulk" : "Bruce Banner",
                        "Batman" : "Bruce Wayne",
                        "Superman" : "Clark Kent"]
secretIdentities["Batman"]
secretIdentities["Hulk"] = "Hulk's civilian"

for (key, value) in secretIdentities {
    print("key:\(key) and value:\(value)")
}

