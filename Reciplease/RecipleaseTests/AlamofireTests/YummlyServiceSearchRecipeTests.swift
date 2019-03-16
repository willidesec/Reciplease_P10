//
//  YummlyServiceTests.swift
//  RecipleaseTests
//
//  Created by William on 24/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import XCTest
@testable import Reciplease

class YummlyServiceSearchRecipeTests: XCTestCase {
    
    var ingredients: [String]!
    
    override func setUp() {
        super.setUp()
        ingredients = ["Chicken", "Lemon"]
    }

    func testSearchRecipeShouldPostFailedCallback() {
        let fakeResponse = FakeResponse(response: nil, data: nil, error: FakeResponseData.networkError)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.searchRecipe(for: ingredients) { success, searchResult in
            XCTAssertFalse(success)
            XCTAssertNil(searchResult)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testSearchRecipeShouldPostFailedCallbackIfNoData() {
        let fakeResponse = FakeResponse(response: nil, data: FakeResponseData.incorrectData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.searchRecipe(for: ingredients) { success, searchResult in
            XCTAssertFalse(success)
            XCTAssertNil(searchResult)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testSearchRecipeShouldPostFailedCallbackIfIncorrectResponse() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: FakeResponseData.SearchRecipe.correctData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.searchRecipe(for: ingredients) { success, searchResult in
            XCTAssertFalse(success)
            XCTAssertNil(searchResult)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testSearchRecipeShouldPostFailedCallbackIfResponseCorrectAndNilData() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: nil, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.searchRecipe(for: ingredients) { success, searchResult in
            XCTAssertFalse(success)
            XCTAssertNil(searchResult)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testSearchRecipeShouldPostFailedCallbackIfIncorrectData() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.incorrectData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.searchRecipe(for: ingredients) { success, searchResult in
            XCTAssertFalse(success)
            XCTAssertNil(searchResult)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testSearchRecipeShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.SearchRecipe.correctData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        yummlyService.searchRecipe(for: ingredients) { success, searchResult in
            XCTAssertTrue(success)
            XCTAssertNotNil(searchResult)
            XCTAssertEqual(searchResult?.matches[0].id, "Lemon-Chicken-Scallopini-With-Spinach-2594925")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }

}
