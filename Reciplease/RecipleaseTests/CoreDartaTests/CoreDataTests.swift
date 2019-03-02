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
    override func setUp() {
        super.setUp()
        insertRecipeItem(into: mockContainer.newBackgroundContext())
    }
    
    override func tearDown() {
        Recipe.deleteAll(viewContext: mockContainer.viewContext)
        super.tearDown()
    }
    
    //MARK: - Helper Methods
    private func insertRecipeItem(into managedObjectContext: NSManagedObjectContext) {
        let newRecipeItem = Recipe(context: managedObjectContext)
        newRecipeItem.name = "Pizza"
    }
    
    //MARK: - Unit Tests
    func testInsertManyRecipeItemsInPersistentContainer() {
        XCTAssertNoThrow(try mockContainer.newBackgroundContext().save())
    }
    
    func testCheckIfEntityExistInPersistentContainer() {
        insertRecipeItem(into: mockContainer.newBackgroundContext())
        var isInPersistentContainer = Recipe.checkIfEntityExist(viewContext: mockContainer.viewContext, recipeName: "Hamburger")
        XCTAssertFalse(isInPersistentContainer)
        
        isInPersistentContainer = Recipe.checkIfEntityExist(viewContext: mockContainer.viewContext, recipeName: "Pizza")
        XCTAssertTrue(isInPersistentContainer)
        
    }
    
    func testDeleteOneItemInPersistentContainer() {
        Recipe.deleteRecipe(viewContext: mockContainer.viewContext, recipeName: "Pizza")
        XCTAssertEqual(Recipe.fetchAll(viewContext: mockContainer.viewContext), [])
    }

}
