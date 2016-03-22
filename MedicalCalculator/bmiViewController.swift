//
//  bmiViewController.swift
//  MedicalCalcs
//
//  Created by Sandy Zhang on 3/20/16.
//  Copyright © 2016 Matt Maher. All rights reserved.
//

import UIKit


class englishbmiCalculatorModel {
    
    var weight: Double
    var height: Double
    var bmi: Double {
        get {
            return (weight / (height * height)) * 703
        }
    }
    
    init(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
    }
    
    func returnBMI() -> Double {
        return bmi
    }
    
}


class bmiViewController: UIViewController {
    
    
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var resultsText: UITextView!
    
    
    let bmiCalculator = englishbmiCalculatorModel(weight: 0, height: 0)
    
    func defaultUI() {
        weightText.text = String(format: "%0.0f", bmiCalculator.weight)
        heightText.text = String(format: "%0.0f", bmiCalculator.height)
        resultsText.text = "result"
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
    
    @IBAction func calculateEnglishBMI(sender: AnyObject) {
        bmiCalculator.weight = Double((weightText.text! as NSString).doubleValue)
        bmiCalculator.height = Double((heightText.text! as NSString).doubleValue)
        
        
        var results = ""
        let bmiValue = bmiCalculator.returnBMI()
        let bmiValueString = String(format: "%0.1f", bmiValue)
        results = "\(bmiValueString)"
        resultsText.text = results
    }
    
    
    @IBAction func viewTapped(sender : AnyObject) {
        heightText.resignFirstResponder()
        weightText.resignFirstResponder()
        resultsText.resignFirstResponder()
    }

    
}
