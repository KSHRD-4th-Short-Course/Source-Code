//
//  ViewController.swift
//  MealCollectionDemo
//
//  Created by KSHRD on 11/23/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlet
    @IBOutlet weak var mealTableView: UITableView!
    
    
    // Property
    var mealData : [[String: String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegate and dataSource for tableview
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
        mealTableView.estimatedRowHeight = 120
        mealTableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: "MealTableViewCell", bundle: nil)
        mealTableView.register(nib, forCellReuseIdentifier: "MealTableViewCell")
        
        
        // Generate data
        mealData = MealData.shared.data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell") as! MealTableViewCell
        
        cell.configureCell(with: mealData[indexPath.row])
        
        return cell
    }
}





