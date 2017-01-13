//
//  VacationsTVC.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit

class VacationsTVC: UITableViewController {

    var vacationsHandler = VacationHandler()
    var vacations: [Vacation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        vacations = vacationsHandler.allVacations()
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacationCell", for: indexPath) as! VacationCell
        
        let vacation = vacations[indexPath.row]
        cell.nameLbl.text = (vacation.employee()?.name)!
        cell.dateFromLbl.text = vacation.fromDate
        cell.dateToLbl.text = vacation.toDate
        cell.statusLbl.text = vacation.statusTitle()
        
        
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "VacationDetailsSegue") {
            let path = self.tableView.indexPathForSelectedRow!
            
            let vc = segue.destination as! VacationDetailsTVC
            vc.vacation = vacations[path.row]
        }
    }

}
