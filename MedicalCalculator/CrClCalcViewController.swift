//
//  CrClCalcViewController.swift
//  MedicalCalcs
//
//  Created by Sandy Zhang on 2/20/16.
//  Copyright © 2016 Sandy Zhang. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var serumCreatinineTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var resultsTextView: UITextView!
    
    let crclCalculator = CrClCalculatorModel(age: 0, serumCreatinine: 0, weight: 0)
    
    func defaultUI() {
        ageTextField.text = String(format: "%0.0f", crclCalculator.age)
        serumCreatinineTextField.text = String(format: "%0.0f", crclCalculator.serumCreatinine)
        weightTextField.text = String(format: "%0.0f", crclCalculator.weight)
        resultsTextView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaultUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func calculateMaleCrCl(sender: AnyObject) {
        crclCalculator.age = Double((ageTextField.text! as NSString).doubleValue)
        crclCalculator.serumCreatinine = Double((serumCreatinineTextField.text! as NSString).doubleValue)
        crclCalculator.weight = Double((weightTextField.text! as NSString).doubleValue)
        
        
        var results = ""
        let crClValue = crclCalculator.returnCrClMale()
        let crClValueString = String(format: "%0.1f", crClValue)
        results = "\(crClValueString) mL/min"
        resultsTextView.text = results
    }

    
    @IBAction func calculateFemaleCrCl(sender: AnyObject) {
        crclCalculator.age = Double((ageTextField.text! as NSString).doubleValue)
        crclCalculator.serumCreatinine = Double((serumCreatinineTextField.text! as NSString).doubleValue)
        crclCalculator.weight = Double((weightTextField.text! as NSString).doubleValue)
        
        var results = ""
        let crClValue = crclCalculator.returnCrClFemale()
        let crClValueString = String(format: "%0.1f", crClValue)
        results = "\(crClValueString) mL/min"
        resultsTextView.text = results
    }
    
    
    @IBAction func viewTapped(sender : AnyObject) {
        ageTextField.resignFirstResponder()
        serumCreatinineTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        resultsTextView.resignFirstResponder()
    }
}

