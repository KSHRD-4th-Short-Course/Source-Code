//
//  HomeTableViewController.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 11/11/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SCLAlertView

class HomeTableViewController: UITableViewController, ArticleServiceDelegate {
    
    // Property
    var articles: [Article] = []
    var pagination: Pagination = Pagination()
    
    let articleService = ArticleService()
    
    // Outlet
    @IBOutlet weak var footerindicator: UIActivityIndicatorView!
    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegate
        articleService.delegate = self
        
        // register class
        let nib = UINib(nibName: "TableViewSectionHeader", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewSectionHeaderIdentifier") // register and set identifier
        tableView.estimatedSectionHeaderHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        // TableView Property
        // tableView.estimatedRowHeight = UITableViewAutomaticDimension
        // tableView.rowHeight = UITableViewAutomaticDimension
        
        
        // Add refresh control action
        getData(pageNumber: 1)
    }
    
    // Get data by page number and limit(set static number 15)
    func getData(pageNumber: Int) {
        articleService.getData(pageNumber: pageNumber)
    }
    
    func didRecievedArticle(with articles: [Article]?, pagination: Pagination?, error: Error?) {
        
        // Check error
        if let err = error { SCLAlertView().showError("Error", subTitle: err.localizedDescription); return }
        
        self.pagination = pagination!
        
        // if current == 1 means first request, else append data
        if self.pagination.page == 1 {
            self.articles.removeAll()
            self.articles = articles!
        }else {
            self.articles.append(contentsOf: articles!)
        }
        
        tableView.reloadData()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        FBSDKLoginManager().logOut()
        UserDefaults.standard.removeObject(forKey: "UserID")
        self.dismiss(animated: true, completion: nil)
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
    
    // Section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articles.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewSectionHeaderIdentifier") as! TableViewSectionHeader
        let article = self.articles[section]

        return headerCell
    }
    
    // Row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        
        // Configure the cell...
        cell.configureCell(article: self.articles[indexPath.row])
        
        return cell
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
