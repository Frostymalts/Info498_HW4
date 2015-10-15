//
//  Job.swift
//  HW_4
//
//  Created by Joshua Malters on 10/13/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import Foundation

enum Salary {
    case PerHour(Double)
    case PerYear(Double)
}

class Job {
    var title: String
    var salary: Salary
    
    init(title: String, salary: Salary) {
        self.title = title
        self.salary = salary
    }
    
    func calculateIncome(workedHours: Double) -> Double {
        switch self.salary {
        case .PerHour(let wage):
            return workedHours * wage
        case .PerYear(let wage):
            return wage
        }
    }
    
    func raise(percent: Double) -> Void {
        switch self.salary {
        case .PerHour(let wage):
            self.salary = Salary.PerHour(wage * (1 + percent))
        case .PerYear(let wage):
            self.salary = Salary.PerYear(wage * (1 + percent))
        }
    }
}