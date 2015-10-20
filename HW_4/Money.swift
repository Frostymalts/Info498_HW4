//
//  Money.swift
//  HW_4
//
//  Created by Joshua Malters on 10/13/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import Foundation

struct Money: CustomStringConvertible, Mathmatics {
    var amount: Double
    var currency: String
    
    init (amount: Double, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    var description: String {
        return "\(amount)\(currency)"
    }
    
    // Accepts an ammount, its currency, and the currency you want to covert that
    // value to. Returns an optional Money.
    func convert (ammount: Double, intialCur: String, newCur: String) -> Money? {
        let val = Money(amount: ammount, currency: intialCur)
        let USD = convertToUSD(val)
        if USD == nil {
            return nil
        }
        let usdMon = Money(amount: USD!, currency: "USD")
        let newVal = convertUSDToOther(usdMon, cur: newCur)
        if newVal == nil {
            return nil
        }
        return Money(amount: newVal!, currency: newCur)
    }
    
    // Accepts two Money objects and returns a new Money object with
    // their combined values. The returned currency is that of the second
    // Money object.
    func add (x: Money, valTwo: Money) -> Money? {
        let xUSD = convert(x.amount, intialCur: x.currency, newCur: "USD")
        let yUSD = convert(valTwo.amount, intialCur: valTwo.currency, newCur: "USD")
        if xUSD == nil || yUSD == nil {
            return nil
        }
        
        let combinedValUSD = Money(amount: xUSD!.amount + yUSD!.amount, currency: "USD")
        let otherCurrencyVal = convertUSDToOther(combinedValUSD, cur: valTwo.currency)
        if otherCurrencyVal == nil {
            return nil
        }
        return Money(amount: otherCurrencyVal!, currency: valTwo.currency)
    }
    
    // Accepts two Money objects and returns a new Money object with
    // their subtracted values. The returned currency is that of the second
    // Money object.
    func subtract (x: Money, valTwo: Money) -> Money? {
        let xUSD = convert(x.amount, intialCur: x.currency, newCur: "USD")
        let yUSD = convert(valTwo.amount, intialCur: valTwo.currency, newCur: "USD")
        if xUSD == nil || yUSD == nil {
            return nil
        }
        
        let combinedValUSD = Money(amount: xUSD!.amount - yUSD!.amount, currency: "USD")
        let otherCurrencyVal = convertUSDToOther(combinedValUSD, cur: valTwo.currency)
        if otherCurrencyVal == nil {
            return nil
        }
        return Money(amount: otherCurrencyVal!, currency: valTwo.currency)
    }
    
    // Accepts a Money object and converts its value to USD.
    // Returns a Double a optional.
    private func convertToUSD (val: Money) -> Double? {
        switch val.currency.uppercaseString {
        case "USD":
            return val.amount
        case "GBP":
            return val.amount * 2
        case "EUR":
            return (val.amount * 2) / 3
        case "CAN":
            return (val.amount * 4) / 5
        default :
            return nil
        }
    }
    
    // Takes a Money object that should be of type USD, and secondary currency
    // and returns the value of the USD Money object in the new currency
    private func convertUSDToOther(val: Money, cur: String) -> Double? {
        if val.currency != "USD" {
            return nil
        }
        switch cur.uppercaseString {
        case "USD":
            return val.amount
        case "GBP":
            return val.amount * 0.5
        case "EUR":
            return val.amount * 1.5
        case "CAN":
            return val.amount * 1.25
        default :
            return nil
        }
    }
}