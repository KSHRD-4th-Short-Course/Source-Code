//: Playground - noun: a place where people can play

import UIKit

/*
protocol FullName {
    var fullName: String { get }
}
protocol PersonBehavior {

    init(name: String, namePrefix: String)
    
    func speak()
    func cry()
}

class Person: FullName, PersonBehavior {
    var namePrefix: String
    var name: String
    
    required init(name: String, namePrefix: String) {
        self.name = name
        self.namePrefix = namePrefix
    }
    
    var fullName: String {
        return "\(namePrefix). \(name)"
    }
    
    func speak() {
        print("\(name) speak")
    }
    
    func cry() {
        print("\(name) cry")
    }
}

let person = Person(name: "Pisey", namePrefix: "Mr")
person.speak()
person.fullName

*/

/*
protocol Car: class {
    var name: String { get set }
}

class Camery: Car {
    private var _name = ""
    var model = ""
    var name: String {
        set {
            _name = newValue
        }
        get {
            return _name
        }
    }
    
    init(name: String) {
        self.name = name
    }
}

class Luxes: Car{
    private var _name = ""
    var name: String {
        set { _name = newValue }
        get { return _name }
    }
    
    init(name: String) {
        self.name = name
    }
}

class Person {
    var car: Car
    init(car: Car) {
        self.car = car
    }
}

let person1 = Person(car: Camery(name: "Camery"))
let person2 = Person(car: Luxes(name: "Luxes RX 300"))

person1.car.name
person2.car.name

*/

protocol Animal {
    var lags: Int { get set }
    func run()
    func sleep()
    func eat()

}

extension Animal {
    func sleep() {}
    func eat() {}
    func walk() { print("walk")}
    
}

class Dog: Animal {
    private var _lags = 0
    var lags: Int {
        set { _lags = newValue }
        get { return _lags }
    }
    func run() {
        print("My dog run")
    }
}

extension String {
    
    func testingExtensionOnString() {
        print(#function)
    }
}

let name = "kshrd"
name.testingExtensionOnString()



extension Double {
    var km: Double { return self * 10_000_000.0 }
}

let length : Double = 150
length.km

















