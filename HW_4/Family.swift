//
//  Family.swift
//  HW_4
//
//  Created by Joshua Malters on 10/13/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import Foundation

class Family {
    var members: [Person]
    
    init(members: [Person]) {
        self.members = members
    }
    
    func householdIncome() -> Double {
        var totalIncome = 0.0
        for person in members {
            if person.job != nil {
                switch person.job!.salary {
                case .PerHour(let wage):
                    totalIncome += wage * 2000
                case .PerYear(let wage):
                    totalIncome += wage
                }
            }
        }
        return totalIncome
    }
    
    func haveChild () -> Void {
        let child = Person(firstName: "New", lastName: "Baby", age: 0, job: nil, spouse: nil)
        members.append(child)
    }
}