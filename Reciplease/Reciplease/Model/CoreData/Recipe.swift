//
//  Recipe.swift
//  Reciplease
//
//  Created by William on 10/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation
import CoreData

class Recipe: NSManagedObject {
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Recipe] {
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        guard let favoriteRecipe = try? viewContext.fetch(request) else { return [] }
        return favoriteRecipe
    }
    
    static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        Recipe.fetchAll(viewContext: viewContext).forEach({ viewContext.delete($0) })
        try? viewContext.save()
    }
    
    static func checkIfEntityExist(recipeName: String) -> Bool {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        let predicate = NSPredicate(format: "name == %@", recipeName)
        request.predicate = predicate
        
        // Safety enought ??
//        let count = try? AppDelegate.viewContext.count(for: request)
        guard let count = try? AppDelegate.viewContext.count(for: request) else { return false }
        
        if count == 0 {
            return false
        } else {
            return true
        }
    }
    
}

class Ingredient: NSManagedObject {
    
}

class Instruction: NSManagedObject {
    
}
