//
//  ViewController.swift
//  UISwitchDemo
//
//  Created by KSHRD on 11/17/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
    }
    
    @objc func stateChanged() {
        if mySwitch.isOn {
            myLabel.text = "Switch is on"
        }else {
            myLabel.text = "Switch is off"
        }
    }
    
    @IBAction func click(_ sender: Any) {
        if mySwitch.isOn {
            //mySwitch.isOn = false
            mySwitch.setOn(false, animated: true)
            myLabel.text = "Switch is off"
        }else {
            //mySwitch.isOn = true
            mySwitch.setOn(true, animated: true)
            myLabel.text = "Switch is on"
        }
    }
    
    
}





