//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")


public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
    //  Extra Credits
    enum currencyType: String {
        case USD = "USD"
        case GBP = "GBP"
        case EUR = "EUR"
        case CAN = "CAN"
        case Nil = "Nil"
    }
    
    var amount: Int
    var currency: currencyType
    
    init(amount: Int, currency: String) {
        self.amount = amount
        switch currency {
        case currencyType.USD.rawValue:
            self.currency = currencyType.USD
        case currencyType.GBP.rawValue:
            self.currency = currencyType.GBP
        case currencyType.EUR.rawValue:
            self.currency = currencyType.EUR
        case currencyType.CAN.rawValue:
            self.currency = currencyType.CAN
        default:
            self.currency = currencyType.Nil
            print("Illegal Input: please enter correct currency type!")
        }
    }
    
    mutating func convert(_ newC: String) -> Money {
        var nCur: currencyType = currencyType.Nil
        switch newC {
        case currencyType.USD.rawValue:
            nCur = currencyType.USD
        case currencyType.GBP.rawValue:
            nCur = currencyType.GBP
        case currencyType.EUR.rawValue:
            nCur = currencyType.EUR
        case currencyType.CAN.rawValue:
            nCur = currencyType.CAN
        default:
            print("Illegal Input: please enter correct currency type!")
        }
        
        if nCur != currencyType.Nil {
            self.amount = compute(Cur: currency, nCur: nCur)
        }else {
            self.amount = 0
        }
        return self
    }
    
    func compute(Cur: currencyType, nCur: currencyType) -> Int! {
        var value: Int? = nil
        switch (Cur, nCur) {
        case (currencyType.USD, currencyType.GBP):
            value = amount / 2
        case (currencyType.GBP, currencyType.USD):
            value = amount * 2
        case (currencyType.USD, currencyType.EUR):
            value = amount / 2 * 3
        case (currencyType.EUR, currencyType.USD):
            value = amount / 3 * 2
        case (currencyType.USD, currencyType.CAN):
            value = amount / 4 * 5
        case (currencyType.CAN, currencyType.USD):
            value = amount / 5 * 4
        case (currencyType.GBP, currencyType.EUR):
            value = amount * 3
        case (currencyType.EUR, currencyType.GBP):
            value = amount / 3
        case (currencyType.GBP, currencyType.CAN):
            value = amount / 2 * 5
        case (currencyType.CAN, currencyType.GBP):
            value = amount / 5 * 2
        case (currencyType.EUR, currencyType.CAN):
            value = amount / 6 * 5
        case (currencyType.CAN, currencyType.EUR):
            value = amount / 5 * 6
        default:
            print("Illegal Currency Coverting!")
        }
        return value
    }

}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
  }
  
  open func raise(_ amt : Double) {
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}





