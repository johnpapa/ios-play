import Foundation
import UIKit

class Dog: NSObject, NSCoding {
  var name: String? = nil
  var age: Int = 0
  
  override init() {
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObjectForKey("name") as? String
    self.age = Int(aDecoder.decodeIntForKey("age"))
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.name, forKey: "name")
    aCoder.encodeInt(Int32(self.age), forKey: "age")
  }
}

// Create a Dog that can encode
let dog = Dog()
dog.name = "sally"
dog.age = 3
print(dog.name!)

// Encode the Dog
let data = NSKeyedArchiver.archivedDataWithRootObject(dog)
data.length
print("*** data.length ***")
print("bytes length = \(data.length)")

// Deencode the dog into dog2
let dog2 = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Dog
print(dog2.name!)

// Write the encoded dog to a file
let documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] // as? String
let writePath = "\(documents)/data.dat"
print(writePath)
do {
  try! data.writeToFile(writePath, options: [])
}

// Read the encoded dog from a file
let rawDataFromFile = NSData(contentsOfFile: writePath)!
print("length is still = \(rawDataFromFile.length)")

// Deencode the data from the file into dog3
let dog3 = NSKeyedUnarchiver.unarchiveObjectWithData(rawDataFromFile) as! Dog
print(dog3.name!)




