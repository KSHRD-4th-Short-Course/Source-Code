// 1. Create Table
//    - Set delegate and datasource
//    - Override require methods
//    - Setup data for tableView cell
//    - Set identifier in Code and Interface Builder
//
// 2. Display data : Title and Image



import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlet
    @IBOutlet weak var recipeTable: UITableView!
    
    // Property
    var recipes: [String] = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Delegate and DataSource
        recipeTable.delegate = self
        recipeTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create identifier
        let identifier = "RecipeCell"
        
        // Get cell from tableView by id
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? RecipeTableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier) as? RecipeTableViewCell
        }else {
            cell?.recipeNameLabel.text = recipes[indexPath.row]
            cell?.recipeImageView.image = UIImage(named: recipes[indexPath.row])
            cell?.recipeDetailLabel.text = "# - \(indexPath.row + 1)"
           
        }
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            let destinationView = segue.destination as! RecipeDetailViewController // Get Recipe Detail View
            let indexPath = recipeTable.indexPathForSelectedRow // Get Selected Row
            destinationView.titleHolder = recipes[(indexPath?.row)!]
        }
    }
}
















