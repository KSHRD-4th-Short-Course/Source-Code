//
//  ViewController.swift
//  MealCollectionDemo
//
//  Created by KSHRD on 11/23/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlet
    @IBOutlet weak var mealTableView: UITableView!
    
    
    // Property
    var mealData : [[String: String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Set title
        self.title = "MEAL"
        
        // Set up TableView
        setupTableView()
        
        // Set up Bar Button Item
        setupBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupTableView() {
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
    
    func setupBarButton() {
        // Custom Button
//        let barButton = UIBarButtonItem()
//        barButton.title = "Add Data"
//        barButton.target = self
//        barButton.action = #selector(AddDataAction)
        
        // Use Default Style Button
        let barButton1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddDataAction))
   
        navigationItem.rightBarButtonItem = barButton1
    }
    
    @objc func AddDataAction() {
        print("Data has been added")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check segue id
        if segue.identifier == "showMealDetail" {
            
            // Get MealDetailViewController object from Segue Destination
            let dest = segue.destination as! MealDetailViewController
            dest.mealHolder = sender as! [String : String]  // Pass Data
        }
    }
}




extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell") as! MealTableViewCell
        
        cell.configureCell(with: mealData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get Data from each selected row
        let meal = mealData[indexPath.row]
        
        // Call Segue with ID
        performSegue(withIdentifier: "showMealDetail", sender: meal)
    }
    
    
}









