//
//  VacationDetailsTVC.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/14/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class VacationDetailsTVC: UITableViewController {
    
    @IBOutlet weak var nameTF: JVFloatLabeledTextField!
    @IBOutlet weak var fromDateTF: JVFloatLabeledTextField!
    @IBOutlet weak var toDateTF: JVFloatLabeledTextField!
    @IBOutlet weak var employeeNotesTF: JVFloatLabeledTextField!
    @IBOutlet weak var responseNotesTF: JVFloatLabeledTextField!
    @IBOutlet weak var statusSC: UISegmentedControl!
    
    var vacationHandler = VacationHandler()
    var vacation: Vacation!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(VacationDetailsTVC.updateVacation))
        self.navigationItem.rightBarButtonItem = saveBtn
        
        
        nameTF.text = (vacation.employee()?.name)!
        fromDateTF.text = vacation.fromDate
        toDateTF.text = vacation.toDate
        employeeNotesTF.text = vacation.employeeNotes
        responseNotesTF.text = vacation.responseNotes
        statusSC.selectedSegmentIndex = vacation.status
    }
    
    
    func updateVacation() {
        if vacationHandler.updateVacation(id: vacation.id, status: statusSC.selectedSegmentIndex, notes: responseNotesTF.text!) {
            _ = self.navigationController?.popViewController(animated: true)
        } else {
            AlertUtility.showErrorAlert(message: "Error happened while trying to update vacation request")
        }
    }

}
