//
//  DrugCellTableViewCell.swift
//  MedicalCalcs
//
//  Created by Sandy Zhang on 2/20/16.
//  Copyright © 2016 Sandy Zhang. All rights reserved.
//

import UIKit
import Firebase

class DrugCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var drugText: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var totalVotesLabel: UILabel!
    @IBOutlet weak var thumbVoteImage: UIImageView!
    @IBOutlet weak var locationText: UITextView!

    
    var drug: Drug!
    var voteRef: Firebase!
    
    func configureCell(drug: Drug) {
        self.drug = drug
        
        // Set the labels and textView.
        
        self.drugText.text = drug.drugText
 /*       self.totalVotesLabel.text = "Total Votes:"
        self.usernameLabel.text = "szhang"   */
        self.locationText.text = drug.locationText
        
        // Set "votes" as a child of the current user in Firebase and save the drug's key in votes as a boolean.
        
     /*   voteRef = DataService.dataService.CURRENT_USER_REF.childByAppendingPath("votes").childByAppendingPath(drug.drugKey)
        
        // observeSingleEventOfType() listens for the thumb to be tapped, by any user, on any device.
        
        voteRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            // Set the thumb image.
            
            if let thumbsUpDown = snapshot.value as? NSNull {
                
                // Current user hasn't voted for the drug... yet.
                
                print(thumbsUpDown)
                self.thumbVoteImage.image = UIImage(named: "pillplus")
            } else {
                
                // Current user voted for the drug!
                
                self.thumbVoteImage.image = UIImage(named: "pillminus")
            }
        })  */
    }
    
    
    /*
    func voteTapped(sender: UITapGestureRecognizer) {
        
        // observeSingleEventOfType listens for a tap by the current user.
        
        voteRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            if let thumbsUpDown = snapshot.value as? NSNull {
                print(thumbsUpDown)
                self.thumbVoteImage.image = UIImage(named: "pillplus")
                
                // addSubtractVote(), in Drug.swift, handles the vote.
                
                self.drug.addSubtractVote(true)
                
                // setValue saves the vote as true for the current user.
                // voteRef is a reference to the user's "votes" path.
                
                self.voteRef.setValue(true)
            } else {
                self.thumbVoteImage.image = UIImage(named: "pillminus")
                self.drug.addSubtractVote(false)
                self.voteRef.removeValue()
            }
            
        })
    }


    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // UITapGestureRecognizer is set programatically.
        
        let tap = UITapGestureRecognizer(target: self, action: "voteTapped:")
        tap.numberOfTapsRequired = 1
        thumbVoteImage.addGestureRecognizer(tap)
        thumbVoteImage.userInteractionEnabled = true
    }   */

}
