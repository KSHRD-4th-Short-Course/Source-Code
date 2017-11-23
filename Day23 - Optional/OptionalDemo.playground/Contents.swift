//: Playground - noun: a place where people can play

import UIKit

let str = "hello"
str.substring(to: str.index(str.startIndex, offsetBy: 3))
str.substring(from: str.index(str.endIndex, offsetBy: -2))
str[..<str.index(str.startIndex, offsetBy: 3)]
/*
var age: Int? = 18
var num : Int? = 4
print(age! + num!)
print(age! + 1)

var authorName: String? = "Mark"

if authorName == nil {
    print("no author")
}else {
    let unwrappingAuthorName = authorName!
    print("Author is \(unwrappingAuthorName)")
}


var str: String = "13"
var someInt = Int(str)
someInt = nil

if let tempVar = someInt {
    print("Value = \(tempVar)")
}else {
    print("no value")
}

var isTrue = false
var gender = isTrue ? "Male" : "Female"

var age1 : Int? = 18
//age1 = nil
var unwrappingAge = age1 ?? 0
print(unwrappingAge)

*/

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRoom = 1
}

let person = Person()
//person.residence = Residence()
print(person.residence ?? "------no value----")
if let roomCount = person.residence?.numberOfRoom {
    print(roomCount)
}else {
    print("no room")
}











