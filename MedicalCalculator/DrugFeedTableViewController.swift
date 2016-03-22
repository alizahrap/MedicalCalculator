//
//  DrugFeedTableViewController.swift
//  MedicalCalcs
//
//  Created by Sandy Zhang on 2/20/16.
//  Copyright © 2016 Sandy Zhang. All rights reserved.
//

import UIKit
import Firebase

class DrugsFeedTableViewController: UITableViewController {
    
    var drugs = [Drug]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // observeEventType is called whenever anything changes in the Firebase - new Drugs or Votes.
        // It's also called here in viewDidLoad().
        // It's always listening.
        
        DataService.dataService.DRUG_REF.observeEventType(.Value, withBlock: { snapshot in
            
            // The snapshot is a current look at our drugs data.
            
            print(snapshot.value)
            
            self.drugs = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    
                    // Make our drugs array for the tableView.
                    
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let drug = Drug(key: key, dictionary: postDictionary)
                        
                        // Items are returned chronologically, but it's more fun with the newest drugs first.
                        
                        self.drugs.insert(drug, atIndex: 0)
                    }
                }
                
            }
            
            // Be sure that the tableView updates when there is new data.
            
            self.tableView.reloadData()
        })
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return drugs.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let drug = drugs[indexPath.row]
        
        // We are using a custom cell.
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("DrugCellTableViewCell") as? DrugCellTableViewCell {
            
            // Send the single drug to configureCell() in DrugCellTableViewCell.
            
            cell.configureCell(drug)
            
            return cell
            
        } else {
            
            return DrugCellTableViewCell()
            
        }
        
    }
    
    
    
    
}
