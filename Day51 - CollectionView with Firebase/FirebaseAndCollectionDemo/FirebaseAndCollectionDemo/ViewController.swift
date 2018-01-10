//
//  ViewController.swift
//  FirebaseAndCollectionDemo
//
//  Created by KSHRD on 1/5/18.
//  Copyright © 2018 KSHRD. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // Property
    var data = [DataSnapshot]()
    
    @IBOutlet weak var starCollectionView: UICollectionView!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set collection view delegate
        self.starCollectionView.delegate = self
        self.starCollectionView.dataSource = self
        
        // Create Firebase Database Reference (Connection)
        ref = Database.database().reference()
        
        // TODO: OberveEvent is listening to firebase realtime database
        // on path stars
        let starRef = ref.child("stars")
        starRef.observe(.value) { (snapshot) in
            // convert snapshot to array
            if let stars = snapshot.children.allObjects as? [DataSnapshot] {
                self.data = stars // Set value from firebase to array
                self.starCollectionView.reloadData() // reload to display new data
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Create custom cell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StarCell", for: indexPath) as! StarCollectionViewCell
        
        // Configure cell
        let star = self.data[indexPath.row]
        cell.nameLabel.text = star.key
        
        if let urlString = star.childSnapshot(forPath: "profileUrl").value as? String {
            let url = URL(string: urlString)
            
            do {
                let imageData = try Data(contentsOf: url!)
                cell.profileImageView.image = UIImage(data: imageData)
            }catch {
                print("Download Image Error")
                cell.profileImageView.image = #imageLiteral(resourceName: "noimage_thumbnail")
            }
        }else {
            cell.profileImageView.image = #imageLiteral(resourceName: "noimage_thumbnail")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = ((self.starCollectionView.bounds.size.width - 20) / 2) - 10
        
        return CGSize(width: size, height: size)
    }
    

    @IBAction func addStar(_ sender: Any) {
        let alertController = UIAlertController(title: "New Star", message: nil, preferredStyle: .alert)
        
        // Add textfield
        alertController.addTextField { (nameTextField) in
            nameTextField.placeholder = "Name"
        }
        
        alertController.addTextField { (profileUrlTextField) in
            profileUrlTextField.placeholder = "Profile URL"
        }
        
        // Alert button
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            let name = alertController.textFields?.first?.text
            let profileUrl = alertController.textFields?.last?.text
            print("Name: \(name)\nUrl: \(profileUrl)")
            self.ref.child("stars").child(name!).setValue(["profileUrl":profileUrl!])
           
            self.ref.childByAutoId() // Get AutoID
            print(self.ref.childByAutoId())
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        // Add button to controller
        alertController.addAction(okButton)
        alertController.addAction(cancel)
        
        // Present Alert Controller
        present(alertController, animated: true, completion: nil)
    }
}
