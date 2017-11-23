//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by KSHRD on 11/14/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Property
    var recipes: [String] = []
    
    // Outlet
    @IBOutlet weak var recipeTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial data
        recipes = ["Egg Benedict", "Mushroom Risotto",
                   "Full Breakfast",  "Hamburger",
                   "Ham and Egg Sandwich", "Creme Brelee",
                   "White Chocolate Donut", "Egg Benedict", "Mushroom Risotto",
                   "Full Breakfast",  "Hamburger",
                   "Ham and Egg Sandwich", "Creme Brelee",
                   "White Chocolate Donut"]
        
        // Set delegate and dataSource for tableView
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count // return row based on element in array recipe
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\(#function) ---- \(indexPath.row)")
        var identifier = ""
        if indexPath.row % 2 == 0 {
            identifier = "recipeIDBlue"
        }else {
            identifier = "recipeIDOrange"
        }
        
        // Get Cell from tableview by identifier
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        // Check cell
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier:  identifier)
        }else {
            // Get value from array then assign to label
            cell?.textLabel?.text = recipes[indexPath.row]
            cell?.detailTextLabel?.text = "HRD"
            cell?.imageView?.image = #imageLiteral(resourceName: "placeholder")
        }
        
        return cell!
    }
    
    
}








