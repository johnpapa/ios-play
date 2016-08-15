import UIKit
import Foundation

// We can extend any class with our own functionality

extension String {
  var reverse: String {
    var result = ""
    for character in self.characters.reverse() {
      result.append(character)
    }
    return result
  }
}

"Chris".reverse

extension NSDate {
  func yearsSinceReferenceDate() -> NSTimeInterval {
    // bad calc :-)
    return self.timeIntervalSinceReferenceDate / (3600*24*365)
  }
}
let now = NSDate()
print("\(now.yearsSinceReferenceDate()) since ref date")


// Tuples

class Guest {
  var first: String = "John"
  var last: String = "Papa"

  var full: (String, String) {
    set {
      self.first = newValue.0
      self.last = newValue.1
    }
    get {
      return (first, last)
    }
  }
}

var g = Guest()
g.full = ("Fred", "Flintstone")
print(g.full)

// Dictionaries

let dict = ["Chris": " Garrett", "John": "Papa"]


for (key, value) in dict.enumerate()  {
  // TODO
  print("key = \(key) and value = \(value)")
}


let ordinals = [
  1: "first",
  2: "second",
  3: "third"
]

