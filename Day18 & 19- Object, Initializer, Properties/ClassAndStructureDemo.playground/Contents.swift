//: Playground - noun: a place where people can play

import UIKit

// Struct declaration
class Person {
    var name: String
    var age : Int {
        return 18
    }
    var gender: Bool
    
    init(name: String, gender: Bool) {
        self.name = name
        self.gender = gender
    }
    
     func speak() {
        print("Person speaks")
    }
   
    static var description: String  = "this is person description"
}

class Child: Person {
    var school :String = ""
    
    // override property
    override var age: Int {
        return 3
    }
    
    init(name: String, school: String, staticParam: String) {
        super.init(name: name, gender: true)
        
        self.school = school
        Person.description = staticParam
    }
    
    // override method
    override func speak() {
        print("Child speaks")
    }
    
    func makeNoise() {
        print(#function)
    }
}

// Create child object
var myChild = Child(name: "", school: "", staticParam: "this is child description")
myChild.speak()
Child.description
Person.description

var person1 = Person(name: "", gender: false)
person1.speak()











