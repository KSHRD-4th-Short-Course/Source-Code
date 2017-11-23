//
//  RecipeDetailViewController.swift
//  RecipeApp
//
//  Created by KSHRD on 11/17/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    
    var titleHolder : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("\(titleHolder)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
