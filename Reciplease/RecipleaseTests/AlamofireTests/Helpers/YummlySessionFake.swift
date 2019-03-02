//
//  YummlySessionFake.swift
//  RecipleaseTests
//
//  Created by William on 24/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation
import Alamofire
@testable import Reciplease

class YummlySessionFake: YummlySession {
    
    private let fakeResponse: FakeResponse
    
    init(fakeResponse: FakeResponse) {
        self.fakeResponse = fakeResponse
        super.init()
    }
    
    override func request(url: URL, callback: @escaping (DataResponse<Any>) -> Void) {
        let httpResponse = fakeResponse.response
        let data = fakeResponse.data
        let error = fakeResponse.error
        
        let result = Request.serializeResponseJSON(options: .allowFragments, response: httpResponse, data: data, error: error)
        let urlRequest = URLRequest(url: URL(string: "http://api.yummly.com/v1/api/recipes?_app_id=5518c13f&_app_key=781f4dbcf40703ec5bdd1d709185e6ff&q=chicken&allowedIngredient[]=chicken")!)
        callback(DataResponse(request: urlRequest, response: httpResponse, data: data, result: result))
    }
}
