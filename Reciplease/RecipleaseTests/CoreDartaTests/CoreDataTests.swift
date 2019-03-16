//
//  CoreDataTests.swift
//  RecipleaseTests
//
//  Created by William on 02/03/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import XCTest
import CoreData
@testable import Reciplease

class CoreDataTests: XCTestCase {
    
    //MARK: - Properties
    lazy var mockContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Reciplease")
        container.persistentStoreDescriptions[0].url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: { (description, error) in
            XCTAssertNil(error)
        })
        return container
    }()
    
    //MARK: - Helper Methods
    private func insertRecipeItem(_ recipe: String, into managedObjectContext: NSManagedObjectContext) {
        let newRecipeItem = Recipe(context: managedObjectContext)
        newRecipeItem.name = recipe
        try? managedObjectContext.save()
    }
    
    //MARK: - Unit Tests
    func testInsertRecipeItemInPersistentContainer() {
        insertRecipeItem("Pizza", into: mockContainer.viewContext)
        XCTAssertNoThrow(try mockContainer.viewContext.save())
    }
    
    func testFetchOneItemInPersistentContainer() {
        let context = mockContainer.viewContext
        insertRecipeItem("Pizza", into: context)
        insertRecipeItem("Hamburger", into: context)
        let recipe = Recipe.fetch(viewContext: context, with: "Pizza")
        XCTAssertEqual(recipe.count, 1)
    }
    
    func testCheckIfEntityExistInPersistentContainer() {
        let context = mockContainer.viewContext
        insertRecipeItem("Pizza", into: context)
        var isInPersistentContainer = Recipe.checkIfEntityExist(viewContext: context, recipeName: "Hamburger")
        XCTAssertFalse(isInPersistentContainer)
        
        isInPersistentContainer = Recipe.checkIfEntityExist(viewContext: context, recipeName: "Pizza")
        XCTAssertTrue(isInPersistentContainer)
        
    }
    
    func testDeleteOneItemInPersistentContainer() {
        insertRecipeItem("Pizza", into: mockContainer.viewContext)
        Recipe.deleteRecipe(viewContext: mockContainer.viewContext, recipeName: "Pizza")
        XCTAssertEqual(Recipe.fetchAll(viewContext: mockContainer.viewContext), [])
    }
    
    func testDeleteAllItemInPersistentContainer() {
        let context = mockContainer.viewContext
        insertRecipeItem("Pizza", into: context)
        insertRecipeItem("Hamburger", into: context)
        Recipe.deleteAll(viewContext: context)
        XCTAssertEqual(Recipe.fetchAll(viewContext: context), [])
    }

}
