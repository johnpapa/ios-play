//
//  DataService.swift
//  TabSharedData
//
//  Created by Papa, John L on 8/18/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import Foundation


class DataService {
  static let shared =  DataService()
  
  var people = [Person]()
  
  init() {
    self.people.append(Person(name: "John", age: 23))
    self.people.append(Person(name: "Dave", age: 72))
    self.people.append(Person(name: "Landon", age: 7))
    self.people.append(Person(name: "Madelyn", age: 11))
    self.people.append(Person(name: "Pam", age: 53))
    self.people.append(Person(name: "Donald", age: 3))
    self.people.append(Person(name: "Zeke", age: 33))
    self.people.append(Person(name: "Tom", age: 14))
    self.people.append(Person(name: "Brian", age: 41))
  }
  
  func get(criteria:(person: Person) -> (Bool)) -> [Person] {
    var newlist = [Person]()
    
    for p in people {
      if criteria(person: p) == true {
        newlist.append(p)
      }
    }
    return newlist
  }
}

