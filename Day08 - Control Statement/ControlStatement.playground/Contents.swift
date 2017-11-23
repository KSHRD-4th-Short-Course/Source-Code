//: Playground - noun: a place where people can play

import UIKit

/*
var isWin = false
if isWin == false {
    print("You have win this game")
}

var age = 21
if age < 30 && age == 20 {
    print("You are young")
}

var name = "kshrd"
if name.isEmpty {
    print("Your input is empty")
} else if name == "kshrd" {
    print("Korea Software HRD Center")
} else {
   print("You name is \(name)")
}
*/


// Switch Statement


var age = 10

switch age {
case 1...8:
    print("Child")
case 9...17:
    print("Adult")
case 18...100:
    print("Old People")
default:
    print("Unknown")
}


let names = ["Jonh", "Jonny", "Moon", "Jam"]

for name in names {
    print("Hello \(name)")
}

let scores = [60, 80, 90, 56, 100]
for i in 0..<scores.count {
    //print("Index = " + String(i) + " and value = \(scores[i])")
}

for i in stride(from: 0, to: 10, by: 3) {
   // print(i)
}

let helloWorld = "Hello World. This is Cambodia"

for i in helloWorld.split(separator: " ") {
   // print(i)
}

for i in (1...50).reversed() {
    //print(i)
}

var startValue = 0

while startValue < 1 {
    print(startValue)
    startValue += 2
}

repeat {
    startValue += 1
    print("\(startValue) - before")
    
    if startValue == 5 {
        continue
    }
    print("\(startValue) - after")
    
} while startValue < 10










