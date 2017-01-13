//
//  Array+Extension.swift
//  Le Cadeau
//
//  Created by Mohammad Shaker on 2/10/16.
//  Copyright © 2016 AMIT-Software. All rights reserved.
//

import Foundation

extension Array where Element : Hashable {
    var unique: [Element] {
        return Array(Set(self))
    }
}
