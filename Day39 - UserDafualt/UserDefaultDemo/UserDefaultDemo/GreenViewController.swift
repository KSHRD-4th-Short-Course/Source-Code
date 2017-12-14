//
//  GreenViewController.swift
//  UserDefaultDemo
//
//  Created by KSHRD on 12/13/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(UserDefaults.standard.string(forKey: "CustomerName111"))
        // UserDefaults.standard.removeObject(forKey: "CustomerName")
        if let name = UserDefaults.standard.string(forKey: "CustomerName") {
            nameLabel.text = name
        }
        
    }

    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}




