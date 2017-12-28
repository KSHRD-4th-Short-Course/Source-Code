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
import NVActivityIndicatorView

class HomeTableViewController: UITableViewController, ArticleServiceDelegate, NVActivityIndicatorViewable {
    
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
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "TableViewSectionHeaderIdentifier") // register and set identifier
        tableView.estimatedSectionHeaderHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        // TableView Property
        // tableView.estimatedRowHeight = UITableViewAutomaticDimension
        // tableView.rowHeight = UITableViewAutomaticDimension
        
        
        // Add refresh control action
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing data...")
        self.refreshControl?.tintColor = .red
        self.refreshControl?.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: .valueChanged)
        
        
        getData(pageNumber: 1)
    }
    
    // Get data by page number and limit(set static number 15)
    func getData(pageNumber: Int) {
        if pageNumber == 1 {
            // Create NVActivityIndicator
            let size = CGSize(width: 30, height: 30)
            startAnimating(size, message: "Loading...", type: .ballBeat)
        }
        
        articleService.getData(pageNumber: pageNumber)
    }
    
    func didRecievedArticle(with articles: [Article]?, pagination: Pagination?, error: Error?) {
        self.stopAnimating() // Stop NVActivityIndicatorView
        // hide footer and indicator
        self.footerView.isHidden = true
        self.footerindicator.stopAnimating()
        self.refreshControl?.endRefreshing() // Stop animate refresh control
        
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
    
    // Refresh Control event
    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        
        // Simply get data from first page which is latest data
        getData(pageNumber: 1)
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
        let headerCell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewSectionHeaderIdentifier") as! TableViewSectionHeader
        let article = self.articles[section]
        headerCell.configureCellWithTitle(article.author.name, dateTime: article.createdDate, imageUrl: article.author.imageUrl)
        return headerCell
    }
    
    // Row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        // return self.arrayList[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell

        // Configure the cell...
        cell.configureCell(article: self.articles[indexPath.section])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        print("\(indexPath.section + 1)  == \(self.articles.count)")
        
        if !self.footerindicator.isAnimating {
            // last display cell > or = amount of article
            if indexPath.section + 1 >= self.articles.count {
                
                // Current < total pages
                if self.pagination.page < self.pagination.totalPages {
                    self.footerView.isHidden = false
                    self.footerindicator.startAnimating()
                    getData(pageNumber: self.pagination.page + 1)
                }
            }
        }
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
