//
//  Double.swift
//  HW_4
//
//  Created by Joshua Malters on 10/20/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import Foundation

extension Double {
    var USD:Money { return Money(amount: self, currency: "USD") }
    var EUR:Money { return Money(amount: self, currency: "EUR") }
    var GBP:Money { return Money(amount: self, currency: "GBP") }
    var CAN:Money { return Money(amount: self, currency: "CAN") }
}