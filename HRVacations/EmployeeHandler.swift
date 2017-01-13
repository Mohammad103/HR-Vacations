//
//  EmployeeHandler.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit

class EmployeeHandler: NSObject {
    
    func login(username: String, password: String) -> Bool {
        if let res = SQLiteAPI.sharedInstance.selectAll(query: "SELECT * FROM employee WHERE username = '\(username)' AND password = '\(password.SHA1())'") {
            while res.next() {
                let name = res.string(forColumn: "name")
                print("name = \(name)")
                return true
            }
        }
        return false
    }

}
