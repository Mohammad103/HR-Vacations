//
//  EmployeeHandler.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit


var LoggedInEmployee: Employee? = nil


class EmployeeHandler: NSObject {
    
    
    func login(username: String, password: String) -> Bool {
        if let res = SQLiteAPI.sharedInstance.selectAll(query: "SELECT * FROM employee WHERE username = '\(username)' AND password = '\(password.SHA1())'") {
            while res.next() {
                LoggedInEmployee = Employee.parse(res: res)
                
                return true
            }
        }
        return false
    }
    
    
    func allEmployees() -> [Employee] {
        var employees: [Employee] = []
        
        if let res = SQLiteAPI.sharedInstance.selectAll(query: "SELECT * FROM employee") {
            while res.next() {
                let employee = Employee.parse(res: res)
                employees.append(employee)
            }
        }
        
        return employees
    }

}
