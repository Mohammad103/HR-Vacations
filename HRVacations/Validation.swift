//
//  Validation.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import Foundation


class Validation {
    
    
    // =====================================
    // ==== Password validation methods ====
    // =====================================
    
    class func isValidPassword(password: String) -> Bool {
        let PassowrdMinLength = 8
        
        guard password.characters.count >= PassowrdMinLength else {
            return false
        }
        return true
    }
    
    
    // ==================================
    // ==== Email validation methods ====
    // ==================================
    
    class func isValidEmail(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        guard NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email) else {
            return false
        }
        return true
    }
    
}
