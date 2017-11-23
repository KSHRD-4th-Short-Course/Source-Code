//: Playground - noun: a place where people can play

import UIKit

class Person {
    var name : String
    
    init(name: String) {
        self.name = name
        print("** \(name) is being initailize")
    }
    
    deinit {
        print("-- \(name) is being deinitailize")
    }
}

var person1: Person? = Person(name: "Jonh")
var person2 = person1
var person3 = person1
person3?.name
person2?.name = "Jimmy"
person3 = nil
person2 = nil
person1?.name












