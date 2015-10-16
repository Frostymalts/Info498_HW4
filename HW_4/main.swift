//
//  main.swift
//  HW_4
//
//  Created by Joshua Malters on 10/13/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import Foundation

// Test money
print("Testing Money")
let m = Money(amount: 10.50, currency: "USD")
let initAmount = 35.25
let convertedAmount = m.convert(initAmount, intialCur: "GBP", newCur: "CAN")
print("Converted 32.25 GBP into \(convertedAmount!.amount) CAN, should be 88.125")
let gbpVal = m.convert(10.50, intialCur: "USD", newCur: "GBP")
print("Money 1 in GBP = \(gbpVal!.amount)")
let eurVal = m.convert(10.50, intialCur: "USD", newCur: "EUR")
print("Money 1 in EUR = \(eurVal!.amount)")
let canVal = m.convert(10.50, intialCur: "USD", newCur: "CAN")
print("Money 1 in CAN = \(canVal!.amount)")
print("")

print("Testing addition and subtraction")
let usdOne = Money(amount: 33.44, currency: "USD")
let usdTwo = Money(amount: 11.11, currency: "USD")
print("Adding the USD amounts \(usdOne.amount) and \(usdTwo.amount)")
let usdResult = usdOne.add(usdOne, y: usdTwo)
print("The result = \(usdResult!.amount)")
print("")
print("Subtracting the USD amounts \(usdOne.amount) and \(usdTwo.amount)")
let usdSubtractResult = usdOne.subtract(usdOne, y: usdTwo)
print("The result = \(usdSubtractResult!.amount)")
print("")
let gerAmount = Money(amount: 33.44, currency: "GBP")
let canAmount = Money(amount: 11.11, currency: "CAN")
print("Adding the GBP amount \(gerAmount.amount) and the CAN ammount \(canAmount.amount)")
let mixedResult = gerAmount.add(gerAmount, y: canAmount)
print("The result = \(mixedResult!.amount) in \(mixedResult!.currency)")
print("")
let eurAmount = Money(amount: 33.44, currency: "EUR")
print("Subtracting the EUR amount \(eurAmount.amount) and the USD ammount \(usdTwo.amount)")
let mixedSubtractResult = eurAmount.subtract(eurAmount, y: usdTwo)
print("The result = \(mixedSubtractResult!.amount) in \(mixedResult!.currency)")
print("")

// Test Job
print("Testing Jobs")
let yearly = Job(title: "Data Scientist", salary: Salary.PerYear(400000))
let hourly = Job(title: "Fry Cook", salary: Salary.PerHour(13.33))
print("Here are the two jobs:")
print("\(yearly.title) with a yearly salary of \(yearly.salary)")
print("\(hourly.title) with an hourly salary of \(hourly.salary)")
let wage = hourly.calculateIncome(882.6)
print("")
print("The \(hourly.title) will make \(wage) if they work 882.6 hours")
print("")
yearly.raise(0.045)
print("The after a 4.5% raise, the \(yearly.title) will make \(yearly.salary)")
print("")

//Test Person
print("Testing Person")
let john = Person(firstName: "John", lastName: "Tucker", age: 24, job: yearly, spouse: nil)
let jil = Person(firstName: "Jil", lastName: "Smith", age: 14, job: hourly, spouse: john)
print("The people are:")
print(john.toString())
print(jil.toString())

//Test Family
print("Testing Family")
let sarah = Person(firstName: "Sarah", lastName: "Hampton", age: 27, job: hourly, spouse: john)
let sally = Person(firstName: "Sally", lastName: "Hampton", age: 8, job: nil, spouse: nil)
let hamptons = Family(members: [john, jil, sarah, sally])
print("The family is: \(hamptons.toString())")
print("")
print("The family makes \(hamptons.householdIncome()) a year")
print("Adding a child")
hamptons.haveChild()
print("Now the family is: \(hamptons.toString())")

