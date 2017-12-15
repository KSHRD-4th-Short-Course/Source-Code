//: Playground - noun: a place where people can play

import UIKit

let bundle = Bundle.main.url(forResource: "data", withExtension: "json")

let data = try? Data(contentsOf: bundle!)

do {
    let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    print(jsonData)
    // Get main data from json
    let mainData = jsonData as! [String: Any]
    // Title
    let title = mainData["dataTitle"] as! String
    // Version
    let version = mainData["swiftVersion"] as! Int
    // Array of user
    let users = mainData["users"] as! [[String: Any]]
    let firstPerson = users[0]
    firstPerson["age"]
    
} catch let error {
    print(error.localizedDescription)
}

// JSON: {} []
// Consoloe: {} ()
// Swift class: [:] []




