//
//  MealDetailViewController.swift
//  FreshMealApp
//
//  Created by KSHRD on 12/12/17.
//  Copyright © 2017 Kokpheng. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    // Data holder
    var mealHolder: Meal?
    
    // Outlet
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var thumbnailImageHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupContainerView()
        prepareData()
    }
    
    func setupContainerView() {
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
        
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.5
    }
    
    func prepareData() {
        if let meal = self.mealHolder {
            title = meal.title // Navigation title
            
            titleLabel.text = meal.title
            shortDescriptionLabel.text = meal.short_description
            longDescriptionLabel.text = meal.long_description
            thumbnailImageView.image = UIImage(data: meal.image!)
            
            if let image = thumbnailImageView.image {
                let aspect = image.size.height / image.size.width
                
                thumbnailImageHeightConstraint.constant = view.frame.size.width * aspect
            }
        }
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
