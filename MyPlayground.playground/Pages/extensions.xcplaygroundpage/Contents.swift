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
