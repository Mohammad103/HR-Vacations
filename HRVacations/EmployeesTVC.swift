//
//  EmployeesTVC.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit

class EmployeesTVC: UITableViewController {

    
    var employeeHandler = EmployeeHandler()
    var employees: [Employee] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        employees = employeeHandler.allEmployees()
        tableView.reloadData()
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeCell

        let employee = employees[indexPath.row]
        cell.nameLbl.text = employee.name
        cell.jobTitleLbl.text = employee.jobTitle
        

        return cell
    }
    

}
