//
//  DetailTableViewController.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 11/15/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit
import SCLAlertView
import NVActivityIndicatorView
import Kingfisher

class DetailTableViewController: UITableViewController, ArticleServiceDelegate, NVActivityIndicatorViewable {
    
    // Property
    var articleId: String? // Article Holder
    var articleService = ArticleService()
    
    // Outlet
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var coverImageViewHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCell()
        
        // Set delegate
        self.articleService.delegate = self
        
        if let id = articleId {
            self.startAnimating()
            self.articleService.getArticle(by: id)
        }
    }
    
func didRecievedArticle(with articles: Article?, error: Error?) {
    self.stopAnimating()
    
    // Check error
    if let err = error { SCLAlertView().showError("Error", subTitle: err.localizedDescription); return }
    
    if let art = articles {
        self.titleLabel.text = art.title
        self.descriptionLabel.text = art.description
        self.categoryButton.setTitle("    \(art.category.name)     ", for: .normal)
        self.navigationItem.title = art.category.name
        
        let imageUrl = art.imageUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        self.coverImageView.kf.setImage(with: URL(string: imageUrl!), placeholder: #imageLiteral(resourceName: "noimage_thumbnail")) { (image, _, _, _) in
            if let image = image {
                // Calculate aspect
                let aspect = image.size.height / image.size.width
                self.coverImageViewHeight.constant = self.view.frame.size.width * aspect
            }
        }
        
        tableView.reloadData()
    }
}
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    
    func setupCell() {
        self.categoryButton.backgroundColor = #colorLiteral(red: 0.4236315489, green: 0.4478745461, blue: 0.788145721, alpha: 1)
        self.categoryButton.layer.cornerRadius = categoryButton.layer.frame.height / 2
        self.categoryButton.layer.masksToBounds = true
        
        if let image = coverImageView.image {
            // Calculate aspect
            let aspect = image.size.height / image.size.width
            self.coverImageViewHeight.constant = self.view.frame.size.width * aspect
        }
    }
}
