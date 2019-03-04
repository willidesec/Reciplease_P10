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
    
    
    //MARK: - Tests Life Cycle
    override func tearDown() {
//        Recipe.deleteAll(viewContext: mockContainer.viewContext)
        super.tearDown()
    }
    
    //MARK: - Helper Methods
    private func insertRecipeItem(into managedObjectContext: NSManagedObjectContext) {
        let newRecipeItem = Recipe(context: managedObjectContext)
        newRecipeItem.name = "Pizza"
        
    }
    
    //MARK: - Unit Tests
    func testInsertManyRecipeItemsInPersistentContainer() {
        insertRecipeItem(into: mockContainer.viewContext)
        XCTAssertNoThrow(try mockContainer.viewContext.save())
    }
    
    func testCheckIfEntityExistInPersistentContainer() {
        let context = mockContainer.viewContext
        insertRecipeItem(into: context)
        try? context.save()
        var isInPersistentContainer = Recipe.checkIfEntityExist(viewContext: context, recipeName: "Hamburger")
        XCTAssertFalse(isInPersistentContainer)
        
        isInPersistentContainer = Recipe.checkIfEntityExist(viewContext: context, recipeName: "Pizza")
        XCTAssertTrue(isInPersistentContainer)
        
    }
    
    func testDeleteOneItemInPersistentContainer() {
        insertRecipeItem(into: mockContainer.viewContext)
        try? mockContainer.viewContext.save()
        Recipe.deleteRecipe(viewContext: mockContainer.viewContext, recipeName: "Pizza")
        XCTAssertEqual(Recipe.fetchAll(viewContext: mockContainer.viewContext), [])
    }

}
