//
//  FixerProtocol.swift
//  Reciplease
//
//  Created by William on 01/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation
import Alamofire

protocol YummlyProtocol {
    func request(url : URL, callback: @escaping (DataResponse<Any>) -> Void )
}
