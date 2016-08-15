import Foundation
import UIKit

class Person {
  var name: String? = nil
  var dad: Person? = nil
  var kids: [Person] = []
  
  deinit {
    print("\(self.name ?? "unknown") is dellocated")
  }
}

var me: Person? = Person()
me?.name = "John"

var landon: Person? = Person()
landon?.name = "Landon"

me?.kids = [landon!]
//landon?.dad = me

print("wiping landon")
landon = nil

print("wiping me")
me = nil
