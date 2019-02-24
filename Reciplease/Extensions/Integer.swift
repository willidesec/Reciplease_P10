//
//  Integer.swift
//  Reciplease
//
//  Created by William on 10/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation

extension Int {
    mutating func convertSecondsToMinutes() -> String {
        self /= 60
        if self >= 60 {
            self /= 60
            return "\(String(self)) h"
        } else {
            return "\(String(self)) min"
        }
    }
}
