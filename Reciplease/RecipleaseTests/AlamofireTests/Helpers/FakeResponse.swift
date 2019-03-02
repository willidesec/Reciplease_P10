//
//  FakeResponse.swift
//  RecipleaseTests
//
//  Created by William on 24/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation

struct FakeResponse {
    var response: HTTPURLResponse?
    var data: Data?
    var error: Error?
}
