//
//  AddEditInfoTableViewController.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 11/10/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SCLAlertView

class AddEditInfoTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NVActivityIndicatorViewable, ArticleServiceDelegate {
    
    // Property
    let imagePicker = UIImagePickerController()
    var articleHolder: Article?
    
    // Outlet
    @IBOutlet var descriptionLabel: UITextField!
    @IBOutlet var titleLabel: UITextField!
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    
    let service = ArticleService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check article
        if let article = articleHolder {
            titleLabel.text = article.title
            descriptionLabel.text = article.description
            articleImageView.kf.setImage(with: URL(string: article.imageUrl), placeholder: #imageLiteral(resourceName: "noimage_thumbnail"))
        }
        
        
        // Set delegate
        service.delegate = self
        
        // set delegate for imagePicker
        imagePicker.delegate = self
        
    }
    
    // TODO: Save Action
    @IBAction func save(_ sender: Any) {
        // Create NAActivityIndicator
        startAnimating(message: "Loading...")

        // Read Image
        let imageData = UIImageJPEGRepresentation(self.articleImageView.image!, 1)
        service.uploadFile(file: imageData!) { (imageUrl, error) in
            // Check error
            if let err = error { SCLAlertView().showError("Error", subTitle: err.localizedDescription); return }
            
            // Request paramaters
            let paramaters = [
                "title": self.titleLabel.text!,
                "description": self.descriptionLabel.text!,
                "status": "1",
                "image": imageUrl ?? "",
                "author_id": UserDefaults.standard.integer(forKey: "UserID"),
                "category_id": self.categorySegment.selectedSegmentIndex + 1
                ] as [String : Any]
            
            
            // if have article data > update
            if let article = self.articleHolder {
                // Update code
                self.service.updateArticle(with: "\(article.id)", paramaters: paramaters)
            }else {
                // Add new code
                self.service.addArticle(paramaters: paramaters)
            }
            
        }
    }

    func didAddedArticle(error: Error?) {
        print("Add article response")
        stopAnimating() // Stop NV Loading
        
        // Check error
        if let err = error { SCLAlertView().showError("Error", subTitle: err.localizedDescription); return }
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func didUpdatedArticle(error: Error?) {
        stopAnimating() // Stop NV Loading
        
        // Check error
        if let err = error { SCLAlertView().showError("Error", subTitle: err.localizedDescription); return }
        
        self.navigationController?.popViewController(animated: true)
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
