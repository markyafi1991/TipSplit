//
//  TipSplitTests.swift
//  TipSplitTests
//
//  Created by Mark on 2/13/26.
//

import XCTest
@testable import TipSplit

final class BillCalculatorTests: XCTestCase {
    func testTipValue() {
        let calc = BillCalculator(amount: 100, people: 2, tipPercentage: 20)
        XCTAssertEqual(calc.tipValue, 20, accuracy: 0.0001)
    }
    
    func testGrandTotal() {
        let calc = BillCalculator(amount: 50, people: 2, tipPercentage: 10)
        XCTAssertEqual(calc.grandTotal, 55, accuracy: 0.0001)
    }
    
    func testTotalPerPerson() {
        let calc = BillCalculator(amount: 10, people: 2, tipPercentage: 20)
        XCTAssertEqual(calc.totalPerPerson, 6, accuracy: 0.0001)
    }
    
    func testZeroPeopleReturnsZero() {
        let calc = BillCalculator(amount: 10, people: 0, tipPercentage: 20)
        XCTAssertEqual(calc.totalPerPerson, 0, accuracy: 0.0001)
    }
    
    func testZeroTipDoesNotChangeTotal() {
        let calc = BillCalculator(amount: 80, people: 4, tipPercentage: 0)
        XCTAssertEqual(calc.grandTotal, 80, accuracy: 0.0001)
    }
}
