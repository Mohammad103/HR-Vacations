//
//  MyVacationsTVC.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit

class MyVacationsTVC: UITableViewController {

    var vacationsHandler = VacationHandler()
    var vacations: [Vacation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        vacations = vacationsHandler.myVacations()
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyVacationCell", for: indexPath) as! MyVacationCell
        
        let vacation = vacations[indexPath.row]
        cell.dateFromLbl.text = vacation.fromDate
        cell.dateToLbl.text = vacation.toDate
        cell.notesLbl.text = vacation.responseNotes
        cell.statusLbl.text = vacation.statusTitle()
        
        
        return cell
    }

}
