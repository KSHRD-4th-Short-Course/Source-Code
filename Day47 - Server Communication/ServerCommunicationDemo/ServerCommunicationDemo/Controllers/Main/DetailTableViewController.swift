//
//  DetailTableViewController.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 11/15/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    // Property
    
    
    // Outlet
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var coverImageViewHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCell()
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
