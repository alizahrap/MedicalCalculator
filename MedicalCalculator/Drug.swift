//
//  Drug.swift
//  MedicalCalcs
//
//  Created by Sandy Zhang on 2/20/16.
//  Copyright © 2016 Sandy Zhang. All rights reserved.
//

import Foundation
import Firebase

class Drug {
    private var _drugRef: Firebase!
    
    private var _drugKey: String!
    private var _drugText: String!
    private var _drugVotes: Int!
    private var _username: String!
    private var _locationText: String!
    
    var drugKey: String {
        return _drugKey
    }
    
    
    var drugText: String {
        return _drugText
    }
    
    
    var drugVotes: Int {
        return _drugVotes
    }
    
    var username: String {
        return _username
    }
    
    var locationText: String {
        return _locationText
    }
    
    // Initialize the new Drug
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._drugKey = key
        
        // Within the Drug, or Key, the following properties are children
        
        if let votes = dictionary["votes"] as? Int {
            self._drugVotes = votes
        }
        
        if let drug = dictionary["drugText"] as? String {
            self._drugText = drug
        }
        
        if let location = dictionary["locationText"] as? String {
            self._locationText = location
        }
        
        if let user = dictionary["author"] as? String {
            self._username = user
        } else {
            self._username = ""
        }
        
        // The above properties are assigned to their key.
        
        self._drugRef = DataService.dataService.DRUG_REF.childByAppendingPath(self._drugKey)
    }
    
    func addSubtractVote(addVote: Bool) {
        
        if addVote {
            _drugVotes = _drugVotes + 1
        } else {
            _drugVotes = _drugVotes - 1
        }
        
        // Save the new vote total.
        
        _drugRef.childByAppendingPath("votes").setValue(_drugVotes)
        
    }
}

