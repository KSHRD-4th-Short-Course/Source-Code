//
//  ViewController.swift
//  Facebook-Login-Demo
//
//  Created by KSHRD on 12/14/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = FBSDKLoginButton()
        button.center = self.view.center
        self.view.addSubview(button)
    }
}

