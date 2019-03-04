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
        guard let favoriteRecipe = try? viewContext.fetch(request) else { return [] }
        return favoriteRecipe
    }
    
    static func fetch(viewContext: NSManagedObjectContext = AppDelegate.viewContext, with name: String) -> [Recipe] {
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", name)
        guard let recipes = try? viewContext.fetch(request) else { return [] }
        return recipes
    }
    
    static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        Recipe.fetchAll(viewContext: viewContext).forEach({ viewContext.delete($0) })
        try? viewContext.save()
    }
    
    static func deleteRecipe(viewContext: NSManagedObjectContext = AppDelegate.viewContext, recipeName: String) {
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        let predicate = NSPredicate(format: "name == %@", recipeName)
        request.predicate = predicate
        if let objects = try? viewContext.fetch(request) {
            objects.forEach() { viewContext.delete($0) }
        }
        try? viewContext.save()
    }
    
    // TODO: add parameter context to test methods
    static func checkIfEntityExist(viewContext: NSManagedObjectContext = AppDelegate.viewContext, recipeName: String) -> Bool {
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        let predicate = NSPredicate(format: "name == %@", recipeName)
        request.predicate = predicate
        guard let count = try? viewContext.count(for: request) else { return false }
        
        if count == 0 {
            return false
        }
        return true
    }
    
}

class Ingredient: NSManagedObject {
    
}

class Instruction: NSManagedObject {
    
}
