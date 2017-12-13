//
//  HomeTableViewController.swift
//  FreshMealApp
//
//  Created by KSHRD on 12/6/17.
//  Copyright © 2017 Kokpheng. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, UISearchResultsUpdating {
    
    // Outlet
    var resultSearchController = UISearchController(searchResultsController: nil)
    
    // Property
    var data: [Meal] = [] // Store all record from enitity
    var displayedData: [Meal] = [] // Store records which need to dispaly
    var filteredData: [Meal] = [] // Store record from filter

    let mealService = MealService()
    
    
    let imageUrls = [
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/59f25b63a1e1ea6b9e0b9c92-cca4af7f.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/59f25c0dc9fd0832717e2482-ad6134a4.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/upgraded-steak-and-potatoes-d9c26f65.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/pancetta-flatbread-pizzas-5b58cf2e.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/cheddar-smash-burgers-34f4bb93.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/5a036e0651d3f13c8a55a472-d4793e56.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/mediterranean-chicken-thigh-d1bf9150.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/kale-grilled-cheese-sandwich-ebe54e0c.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/spiced-cauliflower-mac-n-cheese-7bc85539.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/chipotle-seitan-chili-1aca3f82.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/brown-rice-bibimbap-57d34f4e.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/cheddar-smash-burgers-998331d8.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/59f25e30a2882a217d17ffc2-dce29963.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/59f25f08a2882a23b21b5112-2eea7a90.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/5a04abf5a2882a5e7f3e0fe2-0af52f06.jpg",
        "https://d3hvwccx09j84u.cloudfront.net/640,0/image/sizzling-balsamic-steak-04907d3a.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation bar
        title = "Fresh Meal Menu"
        
        // Display LargeTitles
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
        }
        
        setupTableView()
        setupSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5676869154, green: 0.7538596988, blue: 0.1165765896, alpha: 1)
        UIApplication.shared.statusBarStyle = .lightContent
        
        // Get data
        if (resultSearchController.searchBar.text?.count)! == 0 {
            data = mealService.getAll()
            displayedData = data
            tableView.reloadData()
        }
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        tableView.reloadData()
    }
    
    func setupTableView() {
        // Dynamic row
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Register Custom Cell
        let nib = UINib(nibName: "MealTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MealTableViewCell")
    }
    
    func setupSearchController() {
        resultSearchController.searchBar.placeholder = "Search Here"
        navigationItem.hidesSearchBarWhenScrolling = true
        resultSearchController.dimsBackgroundDuringPresentation = false
        resultSearchController.searchBar.searchBarStyle = .default
        resultSearchController.searchBar.tintColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue : UIColor.white]
        resultSearchController.searchBar.sizeToFit()
        resultSearchController.searchResultsUpdater = self
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = resultSearchController
        }else {
            tableView.tableHeaderView = resultSearchController.searchBar
        }
    }
    
    // MARK : Search Controller
    func updateSearchResults(for searchController: UISearchController) {
        // Check if the user cancelled or deleted the search term so we can display the full list instead.
        
        if (searchController.searchBar.text?.count)! > 0 {
            // 1 remove all data from filter
            filteredData.removeAll(keepingCapacity: false)
            
            // 2 Create Predication
            let searchPredicate = NSPredicate(format: "SELF.title CONTAINS[c] %@", searchController.searchBar.text!)
            
            // 3 filter data by predication
            filteredData = mealService.get(withPredicate: searchPredicate)
            
            // 4 display data
            displayedData = filteredData
        }else {
            displayedData = data
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // check segue id
        if segue.identifier == "showEdit" {
            let dest = segue.destination as! AddEditMealTableViewController
            dest.mealHolder = sender as? Meal // Pass Data
            navigationController?.dismiss(animated: true, completion: nil)
        } else if segue.identifier == "showMealDetail" {
            // Get MealDetailViewController object from Segue Destination
            let dest = segue.destination as! MealDetailViewController
            dest.mealHolder = sender as? Meal // Pass Data
            navigationController?.dismiss(animated: true, completion: nil)
        }else {
            print("------ unknown segue")
        }
    }
}

extension HomeTableViewController {
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as! MealTableViewCell
        // Configure the cell...
        cell.configureCell(with: displayedData[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get Data from each selected row
        let meal = displayedData[indexPath.row]
        // Call Segue with ID
        self.performSegue(withIdentifier: "showMealDetail", sender: meal)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            // find delete object by id
            let deleteMeal = self.mealService.getBy(id: self.displayedData[indexPath.row].objectID)
            
            // Delete
            self.mealService.delete(id: (deleteMeal?.objectID)!)
            self.displayedData.remove(at: indexPath.row)
            self.mealService.saveChange()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let editButton = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            let editMeal = self.displayedData[indexPath.row]
            self.performSegue(withIdentifier: "showEdit", sender: editMeal)
        }
        
        editButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        deleteButton.backgroundColor = #colorLiteral(red: 0.9587053657, green: 0.3523139656, blue: 0.01222745888, alpha: 1)
        
        return [deleteButton, editButton]
    }
}