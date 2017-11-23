//: Playground - noun: a place where people can play

import UIKit

// Initialize Array
var arr = [1, 3, 4, 6, 7]

let index = 3
if arr.count > index {
    arr[index]
}

// Declaration
let stringArray: [String] = [String]()
let floatArray: Array<Int> = Array<Int>()

// Insert value to array
var letters = ["a", "A", "s", "e", "f", "b"]
letters.append("z") // Add to last position
letters.insert("g", at: 3) // Add to 3rd position
letters.remove(at: 3) // remove 3rd position
letters.index(of: "a") // get index of "element"
letters.append(contentsOf: ["a1", "s2", "e3", "f4", "b5"])
letters.insert(contentsOf: ["d", "f"], at: 0)
//letters.removeLast(5)
//letters.removeAll()
letters.isEmpty


// Sort and Sorted
var unorderNumber = [ "a","a", "b", "e", "s",  "f"]
unorderNumber.sorted { $0 > $1 }
let sortNumber = unorderNumber

print(unorderNumber)

// filter array
let fullArr = [1,33,53,61,8,93,56,63,71]
var filterArr: [Int] = []

filterArr = fullArr.filter { ($0 >= 50 && $0 <= 80)  }

print(filterArr)


// Array loop
fullArr.forEach { print($0) }










