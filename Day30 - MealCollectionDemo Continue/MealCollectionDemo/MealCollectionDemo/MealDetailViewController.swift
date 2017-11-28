//
//  MealDetailViewController.swift
//  MealCollectionDemo
//
//  Created by KSHRD on 11/28/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {

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
        // Do any additional setup after loading the view.
        nameLabel.text = mealHolder["name"]
        categoryLabel.text = mealHolder["category"]
        descriptionLabel.text = mealHolder["description"]
        
        if let url = mealHolder["thumbnail"] {
            thumbnailImageView.downloadImageWith(urlString: url)
            imageHeightConstrant.constant = (thumbnailImageView.image?.size.height)!
        }else {
            print("url not found")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
