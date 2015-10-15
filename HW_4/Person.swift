//
//  Person.swift
//  HW_4
//
//  Created by Joshua Malters on 10/13/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import Foundation

class Person {
    var firstName: String
    var lastName: String
    var age: Int
    var job: Job?
    var spouse: Person?
    
    init(firstName: String, lastName: String, age: Int, job: Job?, spouse: Person?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        if age >= 16 {
            self.job = job
        } else {
            self.job = nil
        }
        if age >= 18 {
            self.spouse = spouse
        } else {
            self.spouse = nil
        }
    }
    
    func toString() -> String {
        var result = firstName + " " + lastName + " is \(age) years old."
        if job != nil {
            result += " They are a \(job!.title)."
        }
        if spouse != nil {
            result += " And they are married to \(spouse!.firstName)"
        }
        return result
    }
}