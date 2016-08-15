import UIKit
import Foundation


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
