//
//  DataService.swift
//  MedicalCalcs
//
//  Created by Sandy Zhang on 2/20/16.
//  Copyright © 2016 Sandy Zhang. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let dataService = DataService()
    
    private var _BASE_REF = Firebase(url: "\(BASE_URL)")
    private var _USER_REF = Firebase(url: "\(BASE_URL)/users")
    private var _DRUG_REF = Firebase(url: "\(BASE_URL)/drugs")
    
    var BASE_REF: Firebase {
        return _BASE_REF
    }
    
    var USER_REF: Firebase {
        return _USER_REF
    }
    
    var CURRENT_USER_REF: Firebase {
        let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
        
        let currentUser = Firebase(url: "\(BASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
        
        return currentUser!
    }
    
    var DRUG_REF: Firebase {
        return _DRUG_REF
    }
    
    func createNewAccount(uid: String, user: Dictionary<String, String>) {
        
        // A User is born.
        
        USER_REF.childByAppendingPath(uid).setValue(user)
    }
    
    func createNewDrug(drug: Dictionary<String, AnyObject>) {
        
        // Save the Drug
        // DRUG_REF is the parent of the new Drug: "drugs".
        // childByAutoId() saves the drug and gives it its own ID.
        
        let firebaseNewDrug = DRUG_REF.childByAutoId()
        
        // setValue() saves to Firebase.
        
        firebaseNewDrug.setValue(drug)
    }
}