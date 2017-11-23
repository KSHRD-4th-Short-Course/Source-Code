//: Playground - noun: a place where people can play

import UIKit

/*
var str: String = "Hello, playground   "
var nsString: NSString = "Hello, playground"

// Length
str.characters.count
nsString.length

// Split String
str.components(separatedBy: ",")
str.split(separator: ",")
nsString.components(separatedBy: ",")

// SubString
nsString.substring(from: 5)
let indexFrom = str.index(str.startIndex, offsetBy: 5)
//str.substring(from: indexTo)
str[indexFrom...] // start from index to infinit index

nsString.substring(to: 5)
let indexTo = str.index(str.startIndex, offsetBy: 5)
//str.substring(to: indexTo)
str[..<str.index(str.startIndex, offsetBy: 5)]

nsString.substring(with: NSRange(location: 3, length: 6))
let startIndex = str.index(str.startIndex, offsetBy: 3)
let endIndex = str.index(str.endIndex, offsetBy: -5)
let rangeIndex = startIndex..<endIndex
str.substring(with: rangeIndex)

nsString.trimmingCharacters(in: CharacterSet.whitespaces)
str.trimmingCharacters(in: CharacterSet.whitespaces)

*/


var arr: [String] = ["Pencil", "PEraser", "Notebook"]
var nsArray: NSMutableArray = ["Pencil", "Eraser", "PNotebook",1 ,3.4]

//arr.remove(at: 2)
//nsArray.remove("Eraser")

arr.filter { element -> Bool in
    element.hasPrefix("Pe")
}

nsArray.filter { element -> Bool in
    let str = element as? String
    print("value == \(str)")
    if str == nil {
        return false
    }else {
        return (str?.hasPrefix("Pe"))!
    }
}

//nsArray.filter(using: NSPredicate(format: "SELF BEGINSWITH 'P'"))













