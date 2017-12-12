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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation bar
        title = "Fresh Meal"
        
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
        
        // Get data
        data = mealService.getAll()
        displayedData = data
        tableView.reloadData()
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
    
    func updateSearchResults(for searchController: UISearchController) {
        
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
    
    
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return displayedData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as! MealTableViewCell
        
        // Configure the cell...
        cell.configureCell(with: displayedData[indexPath.row])

        return cell
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
        
        deleteButton.backgroundColor = .red
        editButton.backgroundColor = .blue
        
        return [deleteButton, editButton]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let meal = self.displayedData[indexPath.row]
        resultSearchController.isActive = false
        self.performSegue(withIdentifier: "showMealDetail", sender: meal)
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showEdit" {
            let dest = segue.destination as! AddEditMealTableViewController
            dest.mealHolder = sender as? Meal
        } else if segue.identifier == "showMealDetail" {
            let dest = segue.destination as! MealDetailViewController
            dest.mealHolder = sender as? Meal
        }else {
            print("------ unknown segue")
        }
    }
   

}





