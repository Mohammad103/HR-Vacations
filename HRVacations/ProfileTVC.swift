//
//  ProfileTVC.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class ProfileTVC: UITableViewController {
    
    
    @IBOutlet weak var nameLbl: JVFloatLabeledTextField!
    @IBOutlet weak var usernameLbl: JVFloatLabeledTextField!
    @IBOutlet weak var vacationsLbl: JVFloatLabeledTextField!
    @IBOutlet weak var jobTitleLbl: JVFloatLabeledTextField!
    @IBOutlet weak var roleLbl: JVFloatLabeledTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        
        nameLbl.text = LoggedInEmployee?.name
        usernameLbl.text = LoggedInEmployee?.username
        vacationsLbl.text = "\((LoggedInEmployee?.vacations)!)"
        jobTitleLbl.text = LoggedInEmployee?.jobTitle
        roleLbl.text = LoggedInEmployee?.roleTitle()
    }
    
}
