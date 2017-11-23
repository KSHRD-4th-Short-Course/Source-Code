//
//  Person.swift
//  MemoryManagmentUIDemo
//
//  Created by KSHRD on 11/21/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import Foundation

class Person {
    var name : String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("-- Person \(name) is being deinitailize")
    }
}

class Apartment {
    var unit: String
    unowned var tenant: Person
    
    init(unit: String, person: Person) {
        self.unit = unit
        self.tenant = person
    }
    
    deinit {
        print("-- Apartment \(unit) is being deinitailize")
    }
    
}






