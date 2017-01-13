//
//  AddVacationTVC.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/14/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit
import DateTools
import JVFloatLabeledTextField

class AddVacationTVC: UITableViewController {

    @IBOutlet weak var fromDateTF: JVFloatLabeledTextField!
    @IBOutlet weak var toDateTF: JVFloatLabeledTextField!
    @IBOutlet weak var notesTF: JVFloatLabeledTextField!
    
    var vacationHandler = VacationHandler()
    
    lazy var fromDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.minimumDate = NSDate().addingDays(1) // Tomorrow
        picker.datePickerMode = .date
        picker.tintColor = UIColor(fromARGBHexString: "2B3B4E")
        return picker
    }()
    
    lazy var toDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.minimumDate = NSDate().addingDays(1) // Tomorrow
        picker.datePickerMode = .date
        picker.tintColor = UIColor(fromARGBHexString: "2B3B4E")
        return picker
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFromDatePicker()
        setupToDatePicker()
        
        fromDateTF.addTarget(self, action: #selector(AddVacationTVC.textFieldDidChange(textField:)), for: .editingChanged)
        toDateTF.addTarget(self, action: #selector(AddVacationTVC.textFieldDidChange(textField:)), for: .editingChanged)
        notesTF.addTarget(self, action: #selector(AddVacationTVC.textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    private func checkForRequiredFields() -> Bool {
        var res = true
        
        // Check for from date
        if (fromDateTF.text?.isEmpty == true) {
            fromDateTF.showExclamationMark()
            res = false
        }
        
        // Check for to date
        if (toDateTF.text?.isEmpty == true) {
            toDateTF.showExclamationMark()
            res = false
        }
        
        return res
    }
    
    
    private func navigateToHome() {
        let viewController = Storyboard.instantiateViewController(withIdentifier: "HomeTBC") as! UITabBarController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    
    @IBAction func handleRequest() {
        self.view.endEditing(true)
        
        if (!self.checkForRequiredFields()) {
            return
        }
        
        if vacationHandler.addVacation(fromDate: fromDateTF.text!, toDate: toDateTF.text!, notes: notesTF.text!) {
            _ = self.navigationController?.popViewController(animated: true)
        } else {
            AlertUtility.showErrorAlert(message: "Error happened while trying to request vacation")
        }
    }
    
    
    func textFieldDidChange(textField: UITextField) {
        if (textField.text?.isEmpty == true) {
            textField.showExclamationMark()
        } else {
            textField.hideExclamationMark()
        }
    }
    
    
    private func dateToFormattedString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    }
    
    
    // ================================
    // ==== Setup From Date Picker ====
    // ================================
    
    private func setupFromDatePicker() {
        weak var weakPicker = fromDatePicker
        fromDateTF.inputView = weakPicker
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 44)
        let toolbar = UIToolbar(frame: frame)
        let flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddVacationTVC.doneFromPickerBtnClicked))
        let clearBtn = UIBarButtonItem(title: NSLocalizedString("Clear", comment: ""), style: .plain, target: nil, action: #selector(AddVacationTVC.clearFromPickerBtnClicked))
        
        toolbar.items = [clearBtn, flexibleSpaceButton, doneBtn]
        toolbar.tintColor = UIColor(fromARGBHexString: "2B3B4E")
        
        fromDateTF.inputAccessoryView = toolbar
        fromDateTF.delegate = self
    }
    
    func doneFromPickerBtnClicked() {
        self.fromDateTF.resignFirstResponder()
        fromDateTF.text = dateToFormattedString(date: self.fromDatePicker.date)
    }
    
    func clearFromPickerBtnClicked() {
        self.fromDateTF.resignFirstResponder()
        fromDateTF.text = ""
    }
    
    
    // ================================
    // ==== Setup From Date Picker ====
    // ================================
    
    private func setupToDatePicker() {
        weak var weakPicker = toDatePicker
        toDateTF.inputView = weakPicker
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 44)
        let toolbar = UIToolbar(frame: frame)
        let flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddVacationTVC.doneToPickerBtnClicked))
        let clearBtn = UIBarButtonItem(title: NSLocalizedString("Clear", comment: ""), style: .plain, target: nil, action: #selector(AddVacationTVC.clearToPickerBtnClicked))
        
        toolbar.items = [clearBtn, flexibleSpaceButton, doneBtn]
        toolbar.tintColor = UIColor(fromARGBHexString: "2B3B4E")
        
        toDateTF.inputAccessoryView = toolbar
        toDateTF.delegate = self
    }
    
    func doneToPickerBtnClicked() {
        self.toDateTF.resignFirstResponder()
        toDateTF.text = dateToFormattedString(date: self.toDatePicker.date)
    }
    
    func clearToPickerBtnClicked() {
        self.toDateTF.resignFirstResponder()
        toDateTF.text = ""
    }
    
}


// =====================================
// ==== UITextFieldDelegate Methods ====
// =====================================

extension AddVacationTVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case fromDateTF:
            toDateTF.becomeFirstResponder()
        case toDateTF:
            notesTF.becomeFirstResponder()
        case notesTF:
            handleRequest()
        default: break
        }
        
        return true
    }
    
}
