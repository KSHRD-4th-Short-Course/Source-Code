// 1. Create Table
//    - Set delegate and datasource
//    - Override require methods
//    - Setup data for tableView cell
//    - Set identifier in Code and Interface Builder
//
// 2. Display data : Title and Image



import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recipeTable : UITableView = UITableView()
    
    // Property
    var recipes: [String] = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini"]
    // var recipeImages: [UIImage] = [#imageLiteral(resourceName: "Egg Benedict"), #imageLiteral(resourceName: "Mushroom Risotto"), #imageLiteral(resourceName: "Full Breakfast"), #imageLiteral(resourceName: "Hamburger"), #imageLiteral(resourceName: "Ham and Egg Sandwich"), #imageLiteral(resourceName: "Creme Brelee"), #imageLiteral(resourceName: "White Chocolate Donut"), #imageLiteral(resourceName: "Starbucks Coffee"), #imageLiteral(resourceName: "Vegetable Curry"), #imageLiteral(resourceName: "Instant Noodle with Egg"), #imageLiteral(resourceName: "Noodle with BBQ Pork"), #imageLiteral(resourceName: "Japanese Noodle with Pork"), #imageLiteral(resourceName: "Green Tea"), #imageLiteral(resourceName: "Thai Shrimp Cake"), #imageLiteral(resourceName: "Angry Birds Cake"), #imageLiteral(resourceName: "Ham and Cheese Panini")]
    
   // var recipesData = [["name" : "Egg Benedict", "image":#imageLiteral(resourceName: "Egg Benedict")],
//                       ["name" : "Mushroom Risotto", "image":#imageLiteral(resourceName: "Mushroom Risotto")],
//                       ["name" : "Full Breakfast", "image":#imageLiteral(resourceName: "Full Breakfast")],
//                       ["name" : "Hamburger", "image":#imageLiteral(resourceName: "Hamburger")]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTable.frame = UIScreen.main.bounds
        // Set Delegate and DataSource
        recipeTable.delegate = self
        recipeTable.dataSource = self
        view.addSubview(recipeTable)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = recipes[indexPath.row]
        return cell
    }
    
}









