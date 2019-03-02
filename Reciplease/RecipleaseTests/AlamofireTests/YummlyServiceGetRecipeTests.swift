//
//  YummlyServiceGetRecipeTests.swift
//  RecipleaseTests
//
//  Created by William on 24/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import XCTest
@testable import Reciplease

class YummlyServiceGetRecipeTests: XCTestCase {

    var id: String!
    var ingredients: [String]!
    
    override func setUp() {
        super.setUp()
        id = "Slow-Roasted-Beef-Tenderloin-2618548"
        ingredients = ["Chicken", "Lemon"]
    }
    
    func testGetRecipeShouldPostFailedCallback() {
        let fakeResponse = FakeResponse(response: nil, data: nil, error: FakeResponseData.networkError)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.getRecipe(with: "", and: ingredients) { success, recipeDetail in
            XCTAssertFalse(success)
            XCTAssertNil(recipeDetail)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipeShouldPostFailedCallbackIfNoData() {
        let fakeResponse = FakeResponse(response: nil, data: FakeResponseData.incorrectData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.getRecipe(with: id, and: ingredients) { success, recipeDetail in
            XCTAssertFalse(success)
            XCTAssertNil(recipeDetail)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipeShouldPostFailedCallbackIfIncorrectResponse() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: FakeResponseData.GetRecipe.correctData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.getRecipe(with: id, and: ingredients) { success, recipeDetail in
            XCTAssertFalse(success)
            XCTAssertNil(recipeDetail)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipeShouldPostFailedCallbackIfResponseCorrectAndNilData() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: nil, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.getRecipe(with: id, and: ingredients) { success, recipeDetail in
            XCTAssertFalse(success)
            XCTAssertNil(recipeDetail)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipeShouldPostFailedCallbackIfIncorrectData() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.incorrectData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.getRecipe(with: id, and: ingredients) { success, recipeDetail in
            XCTAssertFalse(success)
            XCTAssertNil(recipeDetail)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipeShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.GetRecipe.correctData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.getRecipe(with: id, and: ingredients) { success, recipeDetail in
            XCTAssertTrue(success)
            XCTAssertNotNil(recipeDetail)
            XCTAssertEqual(recipeDetail?.recipeInfos.name, "Slow-Roasted Beef Tenderloin")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }


}
