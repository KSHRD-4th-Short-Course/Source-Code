//
//  AddEditMealTableViewController.swift
//  FreshMealApp
//
//  Created by KSHRD on 12/6/17.
//  Copyright © 2017 Kokpheng. All rights reserved.
//

import UIKit
import MobileCoreServices

class AddEditMealTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Property
    var mealHolder: Meal? = nil
    let imagePicker = UIImagePickerController()
    let service = MealService()
    
    // Outlet
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var shortDescriptionTextField: UITextField!
    @IBOutlet weak var longDescriptionTextView: UITextView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var addEditMealNavigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        setupViewCornerRadius(view: longDescriptionTextView)
        setupViewCornerRadius(view: thumbnailImageView)
        
        imagePicker.delegate = self
        
        if mealHolder != nil {
            titleTextField.text = mealHolder?.title
            shortDescriptionTextField.text = mealHolder?.short_description
            longDescriptionTextView.text = mealHolder?.long_description
            thumbnailImageView.image = UIImage(data: (mealHolder?.image)!)
        }
    }
    
    func setupViewCornerRadius(view: UIView) {
        
        let layer = view.layer
        // Corner
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        // Border
        layer.borderColor = #colorLiteral(red: 0.5676869154, green: 0.7538596988, blue: 0.1165765896, alpha: 1)
        layer.borderWidth = 1
    }
    
    func setupNavigationBar() {
        if #available(iOS 11.0, *) {
            addEditMealNavigationBar.largeTitleDisplayMode = .never
        }
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    // Browse Image library
    @IBAction func browseImage(_ sender: Any) {
        print(#function)
        imagePicker.allowsEditing = false // or true
        imagePicker.sourceType = .photoLibrary // or .camera
        // imagePicker.mediaTypes = [kUTTypeImage as String] //or [kUTTypeMovie as String] or [kUTTypeImage as String, kUTTypeMovie as String]
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        // Convert image to data
        let imageData = UIImageJPEGRepresentation(thumbnailImageView.image!, 1.0)
        
        // Edit Screen
        if self.mealHolder != nil {
            mealHolder?.title = titleTextField.text!
            mealHolder?.short_description = shortDescriptionTextField.text!
            mealHolder?.long_description = longDescriptionTextView.text!
            mealHolder?.image = imageData
            service.update(updatedMeal: mealHolder!)
            
        }else { // Add new
            // Create meal
            _ = service.create(title: titleTextField.text!,
                               shortDescription: shortDescriptionTextField.text!,
                               longDescription: longDescriptionTextView.text!,
                               thumbnailImage: imageData!)
        }
        
        // Save all change
        service.saveChange()
        self.backAction(UIButton())
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(#function)
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumbnailImageView.contentMode = .scaleAspectFit
            thumbnailImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
        dismiss(animated: true, completion: nil)
    }
    
   
    
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}



