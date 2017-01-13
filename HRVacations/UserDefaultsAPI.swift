//
//  UserDefaultsAPI.swift
//  All Star MS
//
//  Created by Mohammad Shaker on 7/21/16.
//  Copyright © 2016 All Star. All rights reserved.
//

import UIKit

class UserDefaultsAPI: NSObject {
    
    
    class func setDefaults() {
        let defaultPrefsFile: String! = Bundle.main.path(forResource: "defaultPrefs", ofType: "plist") ?? ""
        let defaultPreferences: [String: AnyObject] = NSDictionary(contentsOfFile: defaultPrefsFile) as! [String: AnyObject]
        let defaults: UserDefaults = UserDefaults.standard
        defaults.register(defaults: defaultPreferences)
        defaults.synchronize()
    }
    
    class func getUserPreference(key: String!) -> AnyObject {
        let defaults: UserDefaults = UserDefaults.standard
        return defaults.value(forKey: key) as AnyObject
    }
    
    class func setUserPreference(value: AnyObject, key: String!) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
}
