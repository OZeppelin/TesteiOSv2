//
//  Extensions.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

extension String {
    
    var isValidPassword: Bool {
        if !self.isEmpty {
            let passwordPred = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$")
            return passwordPred.evaluate(with: self)
        }
        return false        
    }
    
}
