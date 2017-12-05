//
//  MealDetailViewController.swift
//  MealCollectionDemo
//
//  Created by KSHRD on 11/28/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {

    @IBOutlet weak var navigationItemTitle: UINavigationItem!
    // Outlet
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imageHeightConstrant: NSLayoutConstraint!
    // Data holder
    var mealHolder: [String: String] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItemTitle.title = mealHolder["name"]
       navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        nameLabel.text = mealHolder["name"]
        categoryLabel.text = mealHolder["category"]
        descriptionLabel.text = mealHolder["description"]
        
        if let url = mealHolder["thumbnail"] {
            thumbnailImageView.downloadImageWith(urlString: url, completion: {
                if let image = self.thumbnailImageView.image {
                    // Calculate aspect
                    let aspect = image.size.height / image.size.width
                    
                    self.imageHeightConstrant.constant = self.view.frame.size.width * aspect
                }
            })
            
            thumbnailImageView.clipsToBounds = true
        }else {
            print("url not found")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let image = thumbnailImageView.image {
            // Calculate aspect
            let aspect = image.size.height / image.size.width
            
            imageHeightConstrant.constant = view.frame.size.width * aspect
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
