//
//  AlertUtility.swift
//  All Star MS
//
//  Created by Mohammad Shaker on 7/11/16.
//  Copyright © 2016 All Star. All rights reserved.
//

import Foundation
import SCLAlertView

class AlertUtility {
    
    class func showErrorAlert(message: String!) {
        SCLAlertView().showTitle(
            NSLocalizedString("Error", comment: "Error"),
            subTitle: message,
            duration: 0.0,
            completeText: NSLocalizedString("Dismiss", comment: "Dismiss"),
            style: .error,
            colorStyle: 0x34425A,
            colorTextButton: 0xFFFFFF
        )
    }
    
    class func showSuccessAlert(message: String!) {
        SCLAlertView().showTitle(
            NSLocalizedString("Note", comment: "Note"),
            subTitle: message,
            duration: 0.0,
            completeText: NSLocalizedString("Dismiss", comment: "Dismiss"),
            style: .success,
            colorStyle: 0x34425A,
            colorTextButton: 0xFFFFFF
        )
    }
    
}
