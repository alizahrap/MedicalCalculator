//
//  AddDrugViewController.swift
//  MedicalCalcs
//
//  Created by Sandy Zhang on 2/20/16.
//  Copyright © 2016 Sandy Zhang. All rights reserved.
//


import UIKit
import Firebase

class AddDrugViewController: UIViewController {
    
    @IBOutlet weak var drugField: UITextField!
    @IBOutlet weak var locationField: UITextField!
   /* var currentUsername = "" */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     /*   DataService.dataService.CURRENT_USER_REF.observeEventType(FEventType.Value, withBlock: { snapshot in
            
            let currentUser = snapshot.value.objectForKey("username") as! String
            
            print("Username: \(currentUser)")
            self.currentUsername = currentUser
            }, withCancelBlock: { error in
                print(error.description)
        }) */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func saveDrug(sender: AnyObject) {
        let drugText = drugField.text
        let locationText = locationField.text
        
        if drugText != "" {
            
            
            let newDrug: Dictionary<String, AnyObject> = [
                "drugText": drugText!,
                "locationText": locationText!,
                /*  "votes": 0,
                "author": currentUsername */
            ]
            
            // Send it over to DataService to seal the deal.
            
            DataService.dataService.createNewDrug(newDrug)
            
            if let navController = self.navigationController {
                navController.popViewControllerAnimated(true)
            }
        }
    }
    
    
    /*
    
    @IBAction func logout(sender: AnyObject) {
        
        // unauth() is the logout method for the current user.
        
        DataService.dataService.CURRENT_USER_REF.unauth()
        
        // Remove the user's uid from storage.
        
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        
        // Head back to Login!
        
        let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Login")
        UIApplication.sharedApplication().keyWindow?.rootViewController = loginViewController
    }   */
}
