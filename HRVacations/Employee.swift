//
//  Employee.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit
import FMDB

class Employee: NSObject {
    
    var id: Int = 0
    var name: String = ""
    var username: String = ""
    var jobTitle: String = ""
    var vacations: Int = 0
    var role: Int = 0
    
    
    func roleTitle() -> String {
        switch role {
        case 0:
            return "Normal"
        case 1:
            return "HR Employee"
        default:
            return "Undefined"
        }
    }
    
    
    class func parse(res: FMResultSet) -> Employee {
        let employee = Employee()
        employee.id = Int(res.int(forColumn: "id"))
        employee.name = res.string(forColumn: "name")
        employee.username = res.string(forColumn: "username")
        employee.jobTitle = res.string(forColumn: "job_title")
        employee.vacations = Int(res.int(forColumn: "vacations"))
        employee.role = Int(res.int(forColumn: "role"))
        
        return employee
    }

}
