//
//  calculateCrClModel.swift
//  MedicalCalcs
//
//  Created by Sandy Zhang on 2/20/16.
//  Copyright © 2016 Sandy Zhang. All rights reserved.
//

import Foundation

class CrClCalculatorModel {
    
    var age: Double
    var serumCreatinine: Double
    var weight: Double
    var creatinineClearance: Double {
        get {
            return ((140 - age) / (serumCreatinine)) * (weight / 72)
        }
    }
    
    init(age: Double, serumCreatinine: Double, weight: Double) {
        self.age = age
        self.serumCreatinine = serumCreatinine
        self.weight = weight
    }
    
    func returnCrClMale() -> Double {
        return creatinineClearance
    }
    
    func returnCrClFemale() -> Double {
        let femaleCrCl = creatinineClearance * 0.85
        return femaleCrCl
    }
    
}