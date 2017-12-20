//
//  HomeTableViewController.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 11/11/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    // Property

    // Outlet
    @IBOutlet weak var footerindicator: UIActivityIndicatorView!
    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register class

        
        // Add refresh control action

    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }
}


// MARK: - Table view data source
extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        
        // Configure the cell...

        return UITableViewCell()
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { action, index in

        }
        
        let edit = UITableViewRowAction(style: .default, title: "Edit") { action, index in
            
        }
        
        edit.backgroundColor = UIColor.brown
        return [delete, edit]
    }
}
