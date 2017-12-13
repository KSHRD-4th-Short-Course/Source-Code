//
//  MealService.swift
//  FreshMealApp
//
//  Created by KSHRD on 12/7/17.
//  Copyright © 2017 Kokpheng. All rights reserved.
//

// Step 0
import UIKit
import CoreData

// Step 1
extension Meal {
    // Entity name
    static let entityName = "Meal"
}

// Step 2
class MealService {
    
    // Step 3: Create object
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // Step 4: Create Meal
    func create(title: String,
                shortDescription: String,
                longDescription: String,
                thumbnailImage: Data) -> Meal {
       
        let newMeal = NSEntityDescription.insertNewObject(forEntityName: Meal.entityName, into: context) as! Meal
        newMeal.title = title
        newMeal.short_description = shortDescription
        newMeal.long_description = longDescription
        newMeal.image = thumbnailImage
        
        return newMeal
    }
    
    // Step 6: Get by id
    func getBy(id: NSManagedObjectID) -> Meal? {
        return context.object(with: id) as? Meal
    }
    
    // Step 7: Gets all that fulfill the specified predicate.
    // Predicates examples:
    // - NSPredicate(format: "name == %@", "Juan Carlos")
    // - NSPredicate(format: "name contains %@", "Juan")
    func get(withPredicate queryPredicate: NSPredicate) -> [Meal]{
        
        // fetch record in entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Meal.entityName)
        
        // Apply condition
        fetchRequest.predicate = queryPredicate
        
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [Meal] // convert record to datatype meal
        } catch let error as NSError {
            // failure
            print(error)
            return [Meal]() // return empty record
        }
    }

    // Step 8: Get all record
    func getAll() -> [Meal] {
        return get(withPredicate: NSPredicate(value: true))
    }
    
    // Step 9: Update record
    func update(updatedMeal: Meal) {
        if let meal = getBy(id: updatedMeal.objectID) {
            meal.title =  updatedMeal.title
            meal.short_description = updatedMeal.short_description
            meal.long_description = updatedMeal.long_description
            meal.image = updatedMeal.image
        }
    }
    
    // Step 10: Delete record
    func delete(id: NSManagedObjectID) {
        if let mealToDelte = getBy(id: id) {
            context.delete(mealToDelte)
        }
    }

    // Step 11: Save all change
    func saveChange() {
        do {
            // Success
            try context.save()
        } catch let error as NSError {
            // failure
            print(error.localizedDescription)
        }
    }
    
    // Download Image and Save to library
    func downloadImage(url: String) {
        let data = try? Data(contentsOf: URL(string: url)!)
        let image = UIImage(data: data!)
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
}
