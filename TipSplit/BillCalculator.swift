//
//  BillCalculator.swift
//  TipSplit
//
//  Created by Mark on 2/13/26.
//

import Foundation

struct BillCalculator: Equatable {
    var amount : Double
    var people: Int
    var tipPercentage: Int
    
    var tipValue: Double {
        amount * Double(tipPercentage) / 100
    }
    
    var grandTotal: Double {
        amount + tipValue
    }
    
    var totalPerPerson: Double {
        guard people > 0 else { return 0 }
        return grandTotal / Double(people)
    }
}
