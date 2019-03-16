//
//  String.swift
//  Reciplease
//
//  Created by William on 23/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import Foundation

extension String {
    var separateElementAndReturnArray: [String] {
        get {
            return self.components(separatedBy: .punctuationCharacters).joined().components(separatedBy: " ").filter { !$0.isEmpty }
        }
    }
    
    func dropTwoLastAndReplaceWith(_ characters: String) -> String {
        return self.dropLast(2) + characters
    }
    
    func transformImageUrlToData() -> Data {
        guard let url = URL(string: self) else { return Data() }
        guard let data = try? Data(contentsOf: url) else { return Data() }
        return data
    }
}
