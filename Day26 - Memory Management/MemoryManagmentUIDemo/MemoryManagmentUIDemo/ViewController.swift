//
//  ViewController.swift
//  MemoryManagmentUIDemo
//
//  Created by KSHRD on 11/21/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("enter viewDidLoad function")
        
        var jonh: Person? = Person(name: "Jonh")
        var unit4A: Apartment? = Apartment(unit: "4A", person: jonh!)

        jonh?.apartment = unit4A
        
        print("exit viewDidLoad function")
    
    }

}







