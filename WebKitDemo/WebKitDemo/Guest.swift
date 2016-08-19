//
//  Guest.swift
//  WebKitDemo
//
//  Created by Papa, John L on 8/19/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import Foundation

// ****************************************************************
// This is not used by the app, just used a for a sample unit test
// ****************************************************************
class Guest {
  var firstName: String
  var lastName: String
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  var fullName: String {
    return "\(self.firstName) \(self.lastName)"
  }
}