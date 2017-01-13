//
//  SignInTVC.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class SignInTVC: UITableViewController {
    
    
    @IBOutlet weak var usernameTF: JVFloatLabeledTextField!
    @IBOutlet weak var passwordTF: JVFloatLabeledTextField!
    @IBOutlet weak var showPasswordBtn: UIButton!
    
    var employeeHandler = EmployeeHandler()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.addTarget(self, action: #selector(SignInTVC.textFieldDidChange(textField:)), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(SignInTVC.textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    private func checkForRequiredFields() -> Bool {
        var res = true
        
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
    
    
    private func navigateToHome() {
        let viewController = Storyboard.instantiateViewController(withIdentifier: "HomeTBC") as! UITabBarController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    
    @IBAction func handleSignIn() {
        self.view.endEditing(true)
        
        if (!self.checkForRequiredFields()) {
            return
        }
        
        if (!self.validateAll()) {
            return
        }
        
        if employeeHandler.login(username: usernameTF.text!, password: passwordTF.text!) {
            self.navigateToHome()
        } else {
            AlertUtility.showErrorAlert(message: "Error happened while trying to login")
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

extension SignInTVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTF:
            passwordTF.becomeFirstResponder()
        case passwordTF:
            handleSignIn()
        default: break
        }
        
        return true
    }
    
}
