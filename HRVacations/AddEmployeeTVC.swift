//
//  AddEmployeeTVC.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/14/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class AddEmployeeTVC: UITableViewController {

    @IBOutlet weak var nameTF: JVFloatLabeledTextField!
    @IBOutlet weak var usernameTF: JVFloatLabeledTextField!
    @IBOutlet weak var passwordTF: JVFloatLabeledTextField!
    @IBOutlet weak var jobTitleTF: JVFloatLabeledTextField!
    @IBOutlet weak var vacationsTF: JVFloatLabeledTextField!
    @IBOutlet weak var roleSC: UISegmentedControl!
    @IBOutlet weak var showPasswordBtn: UIButton!
    
    var employeeHandler = EmployeeHandler()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.addTarget(self, action: #selector(AddEmployeeTVC.textFieldDidChange(textField:)), for: .editingChanged)
        usernameTF.addTarget(self, action: #selector(AddEmployeeTVC.textFieldDidChange(textField:)), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(AddEmployeeTVC.textFieldDidChange(textField:)), for: .editingChanged)
        jobTitleTF.addTarget(self, action: #selector(AddEmployeeTVC.textFieldDidChange(textField:)), for: .editingChanged)
        vacationsTF.addTarget(self, action: #selector(AddEmployeeTVC.textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    private func checkForRequiredFields() -> Bool {
        var res = true
        
        // Check for name
        if (nameTF.text?.isEmpty == true) {
            nameTF.showExclamationMark()
            res = false
        }
        
        // Check for username
        if (usernameTF.text?.isEmpty == true) {
            usernameTF.showExclamationMark()
            res = false
        }
        
        // Check for password
        if (passwordTF.text?.isEmpty == true) {
            passwordTF.showExclamationMark()
            res = false
        }
        
        // Check for vacations
        if (vacationsTF.text?.isEmpty == true) {
            vacationsTF.showExclamationMark()
            res = false
        }
        
        return res
    }
    
    private func validateAll() -> Bool {
        // Validate password
        if (!Validation.isValidPassword(password: passwordTF.text!)) {
            AlertUtility.showErrorAlert(message: "Password length should be 8 characters minimum")
            return false
        }
        
        return true
    }
    
    
    @IBAction func handleSave() {
        self.view.endEditing(true)
        
        if (!self.checkForRequiredFields()) {
            return
        }
        
        if (!self.validateAll()) {
            return
        }
        
        if employeeHandler.addEmployee(name: nameTF.text!, username: usernameTF.text!, password: passwordTF.text!, jobTitle: jobTitleTF.text!, vacations: Int(vacationsTF.text!)!, role: roleSC.selectedSegmentIndex) {
            _ = self.navigationController?.popViewController(animated: true)
        } else {
            AlertUtility.showErrorAlert(message: "Error happened while trying to add new employee")
        }
    }
    
    @IBAction func togglePasswordSecureState() {
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
        
        if passwordTF.isFirstResponder {
            passwordTF.becomeFirstResponder()
        }
    }
    
    func textFieldDidChange(textField: UITextField) {
        if (textField.text?.isEmpty == true) {
            textField.showExclamationMark()
        } else {
            textField.hideExclamationMark()
        }
    }
    
}


// =====================================
// ==== UITextFieldDelegate Methods ====
// =====================================

extension AddEmployeeTVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTF:
            usernameTF.becomeFirstResponder()
        case usernameTF:
            passwordTF.becomeFirstResponder()
        case passwordTF:
            jobTitleTF.becomeFirstResponder()
        case jobTitleTF:
            vacationsTF.becomeFirstResponder()
        case vacationsTF:
            handleSave()
        default: break
        }
        
        return true
    }
    
}
