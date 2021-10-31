//
//  Common.swift
//  TenTwenty_Assignment
//
//  Created by Haroon Shoukat on 29/10/2021.
//

import Foundation
import UIKit

class Common {
    static func setApiKey(_ inviteLink: String) {
        
        let defaults = UserDefaults.standard
        defaults.set(inviteLink, forKey: "API_Key")
    }
    
    static func getApiKey() -> String {
        let defaults = UserDefaults.standard
        if(defaults.value(forKey: "API_Key") != nil){
            return defaults.value(forKey: "API_Key") as! String
        }
        else{
            return ""
        }
    }
}
