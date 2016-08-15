import UIKit
import Foundation

class Ride {
  var name: String?
  
  var waitTimeInSeconds: Int = 0 {
    didSet {
      print("did set seconds from \(oldValue) to \(waitTimeInMinutes)")
    }
  }
  
  var waitTimeInMinutes: Int {
    get {
      return waitTimeInSeconds / 60
    }
    set {
      print("setting minutes = \(newValue)")
      waitTimeInSeconds = newValue * 60
    }
  }
  
}

var ride = Ride()

ride.waitTimeInSeconds = 360

print("wait time in seconds = \(ride.waitTimeInSeconds) and in minutes = \(ride.waitTimeInMinutes)")

ride.waitTimeInMinutes = 10

print("wait time in seconds = \(ride.waitTimeInSeconds) and in minutes = \(ride.waitTimeInMinutes)")
