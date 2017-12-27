//
//  AddEditInfoTableViewController.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 11/10/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit

class AddEditInfoTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Property
    let imagePicker = UIImagePickerController()
    
    // Outlet
    @IBOutlet var descriptionLabel: UITextField!
    @IBOutlet var titleLabel: UITextField!
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    
    let service = ArticleService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set delegate for imagePicker
        imagePicker.delegate = self
        
    }
    
    // TODO: Save Action
    @IBAction func save(_ sender: Any) {
        
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension AddEditInfoTableViewController {
    
    // TODO: Browse Image IBAction
    @IBAction func browseImage(_ sender: Any) {
        // coonfig property
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        // show image picker
        present(imagePicker, animated: true, completion: nil)
    }
    
    // TODO: Finish Picking Media
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        // Get image
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            // config property and assign image
            articleImageView.contentMode = .scaleAspectFit
            articleImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    // TODO: Image Picker Controller Did Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // TODO: Take Photo
    @IBAction func openCameraButton(sender: AnyObject) {
        // config property
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // TODO: Image Picker Did Finish Picking Image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        // Set image to articleImageView
        articleImageView.image = image
        self.dismiss(animated: true, completion: nil);
    }
    
}
