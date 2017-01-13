//
//  VacationHandler.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit

class VacationHandler: NSObject {
    
    
    func allVacations() -> [Vacation] {
        var vacations: [Vacation] = []
        
        if let res = SQLiteAPI.sharedInstance.selectAll(query: "SELECT * FROM vacation") {
            while res.next() {
                let vacation = Vacation.parse(res: res)
                vacations.append(vacation)
            }
        }
        
        return vacations
    }
    
    
    func myVacations() -> [Vacation] {
        var vacations: [Vacation] = []
        
        if let res = SQLiteAPI.sharedInstance.selectAll(query: "SELECT * FROM vacation WHERE employee_id = '\((LoggedInEmployee?.id)!)'") {
            while res.next() {
                let vacation = Vacation.parse(res: res)
                vacations.append(vacation)
            }
        }
        
        return vacations
    }
    
    
    func addVacation(fromDate: String, toDate: String, notes: String) -> Bool {
        return SQLiteAPI.sharedInstance.executeQueryWithResult(query: "INSERT INTO vacation (employee_id,from_date,to_date,employee_notes,status,created_at) VALUES ('\((LoggedInEmployee?.id)!)', '\(fromDate)', '\(toDate)', '\(notes)', '0', '')")
    }
    
    
    func updateVacation(id: Int, status: Int, notes: String) -> Bool {
        return SQLiteAPI.sharedInstance.executeQueryWithResult(query: "UPDATE vacation SET status = '\(status)', response_notes = '\(notes)' WHERE id = '\(id)'")
    }
    
}
