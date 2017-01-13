//
//  UITextField+Extenstion.swift
//  Le Cadeau
//
//  Created by Mohammad Shaker on 1/21/16.
//  Copyright © 2016 AMIT-Software. All rights reserved.
//

import UIKit

extension UITextField {
    
    func showExclamationMark() {
        self.rightViewMode = .always
        let exclamationIV = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        exclamationIV.image = UIImage(named: "exclamation")
        exclamationIV.contentMode = .scaleAspectFit
        self.rightView = exclamationIV
    }
    
    func hideExclamationMark() {
        self.rightViewMode = .never
        self.rightView = nil
    }
    
}
