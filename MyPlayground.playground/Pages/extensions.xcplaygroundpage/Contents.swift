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