//
//  Vacation.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit
import FMDB

class Vacation: NSObject {

    var id: Int = 0
    var employeeId: Int = 0
    var fromDate: String = ""
    var toDate: String = ""
    var employeeNotes: String = ""
    var createdAt: String = ""
    var responseNotes: String = ""
    var status: Int = 0
    private var employeeObject: Employee? = nil
    
    
    func statusTitle() -> String {
        switch status {
        case 0:
            return "Pending"
        case 1:
            return "Approved"
        case 2:
            return "Rejected"
        default:
            return "Undefined"
        }
    }
 
    
    class func parse(res: FMResultSet) -> Vacation {
        let vacation = Vacation()
        vacation.id = Int(res.int(forColumn: "id"))
        vacation.employeeId = Int(res.int(forColumn: "employee_id"))
        vacation.fromDate = res.string(forColumn: "from_date")
        vacation.toDate = res.string(forColumn: "to_date")
        vacation.employeeNotes = res.string(forColumn: "employee_notes") ?? ""
        vacation.createdAt = res.string(forColumn: "created_at")
        vacation.responseNotes = res.string(forColumn: "response_notes") ?? ""
        vacation.status = Int(res.int(forColumn: "status"))
        
        return vacation
    }
    
    
    private func loadEmployee() {
        if let res = SQLiteAPI.sharedInstance.selectAll(query: "SELECT * FROM employee WHERE id = \(employeeId)") {
            while res.next() {
                employeeObject = Employee.parse(res: res)
                return
            }
        }
    }
    
    
    func employee() -> Employee? {
        if (employeeObject == nil) {
            loadEmployee()
        }

        return employeeObject
    }
}
