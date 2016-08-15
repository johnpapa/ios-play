import Foundation

class SomeClass {
  var greeting: String
  init(greeting: String) {
    self.greeting = greeting
  }
}

var someclass1 = SomeClass(greeting: "Hello!")
someclass1.greeting

class Customer {
  var name: String;
  var city: String;
  init(name: String?, city: String?) {
    self.name = name!
    self.city = city!
  }
  
  deinit {
    print("i am being deallocated")
  }
}

var c1 = Customer(name: "John", city: "Windermere")
c1.name

// Classes
print("*** Classes")

class BankAccount {
  let maxWithdrawal = 500.00
  var balance = 0.0
  init(balance: Double) {
    self.balance = balance
  }
  
  func withdraw(amount: Double) {
    balance = balance - amount
  }
  
  func deposit(amount: Double) {
    balance = balance + amount
  }
}

var initialBalance: Double = 25000
var ba = BankAccount(balance: initialBalance)
ba.deposit(2000)
ba.withdraw(45)

print("Bank Account balance is $\(ba.balance)")

var myFavoriteAccount: BankAccount? = nil;
var myAccounts: [BankAccount] = [];

class Customer2 {
  var name: String;
  var city: String;
  init(name: String?, city: String?) {
    self.name = name!
    self.city = city!
  }
}

var c2 = Customer2(name: "John", city: "Windermere")

class WashingMachine {
  var isOn = false
  var capacity: Double
  
  //  init() {
  //    self.capacity = 10.0
  //  }
  
  //  init(capacity: Double = 10.0) {
  //    self.capacity = capacity
  //  }
  
  //  init(capacity: Double?) {
  //    if let cap = capacity {
  //      self.capacity = cap
  //      return
  //    }
  //    self.capacity = 0.0
  //  }
  
  init(capacity: Double?) {
    self.capacity = capacity ?? 0.0
  }
  
  func togglePower() {
    self.isOn = !self.isOn
  }
}

let wm2 = WashingMachine(capacity: nil)
print("Our washing machine is \(wm2.isOn ? "ON" : "OFF") and has a capacity of \(wm2.capacity)")

let wm = WashingMachine(capacity: 25.0)
wm.isOn = true

print("Our washing machine is \(wm.isOn ? "ON" : "OFF") and has a capacity of \(wm.capacity)")

wm.togglePower()

print("Our washing machine is \(wm.isOn ? "ON" : "OFF") and has a capacity of \(wm.capacity)")


class Student1 {
  var grades: [Int] = []
  
  func gpa() -> Double {
    if grades.count == 0 {
      return 0.0
    }
    
    var sum = 0.0
    for grade in grades {
      sum = sum + Double(grade)
    }
    return sum / Double(grades.count)
  }
}

class Person {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Student2 : Person {
  var grades:[Double]?
  
  func gpaOld() -> Double {
    if let grades = grades where grades.count > 0 {
      var average:Double = 0.0
      for grade in grades {
        average += grade
      }
      return average/Double(grades.count)
    }
    return 0
  }
  
  func gpa() -> Double {
    if let grades = grades where grades.count > 0 {
      // let average:Double = grades.reduce(0, combine: {$0 + $1})
      let average:Double = grades
        //        .sort()
        //        .map({$0 + 10})
        .map({name == "Brian" ? $0 + 10 : $0})
        .reduce(0, combine: +)
      
      return average/Double(grades.count)
    }
    return 0
  }
}

var stud2 = Student2(name: "Pam")
stud2.grades = [100,80,50,30]
print("\(stud2.name)'s GPA = \(stud2.gpa())")

var stud3 = Student2(name: "Brian")
stud3.grades = [100]
print("\(stud3.name)'s GPA = \(stud3.gpa())")

var stud3b = Student2(name: "Brian")
stud3b.grades = [100,80,60,20]
print("\(stud3b.name)'s GPA = \(stud3b.gpa())")

var stud4 = Student2(name: "Joe")
print("\(stud4.name)'s GPA = \(stud4.gpa())")


import UIKit


class MyUICollectionViewController : UICollectionViewController {
  var foo: String = "bar"
}

class myRecognizer : UITapGestureRecognizer {
  var foo: String = "bar"
}

var myRec1 = myRecognizer()

// Classes with getter/setter and tuples

class Guest {
  var first: String? = nil
  var last: String? = nil
  
  var full: (firstName: String, lastName: String) {
    get {
      let f = first ?? ""
      let l = last ?? ""
      return (f, l)
    }
    set {
      self.first = newValue.0
      self.last = newValue.1
    }
  }

  var fullName: String {
    get {
      switch (first, last) {
        case (.None, .Some(let last)):
          return last
        case (.Some(let first), .None):
          return first
        case (.Some(let first), .Some(let last)):
          return "\(first) \(last)"
        default:
          return ""
      }
    }
    set {
      let names = newValue.componentsSeparatedByString(" ")
      switch names.count {
      case 1:
        self.first = names[0]
      case 2:
        self.first = names[0]
        self.last = names[1]
      default:
        self.first = names.first
        self.last = names.last
      }
    }
  }

  
}
print("Optionals and a computed getter")
var g = Guest()
print("tuple full = \(g.full)")
print("string fullName = \(g.fullName)")
g.first = "John"
print("tuple full = \(g.full)")
print("string fullName = \(g.fullName)")
g.last = "Papa"
print("tuple full = \(g.full)")
print("string fullName = \(g.fullName)")

print(g.full.firstName + " " + g.full.lastName)


g.fullName = "Brian Clark"
print("tuple full = \(g.full)")
print("string fullName = \(g.fullName)")



