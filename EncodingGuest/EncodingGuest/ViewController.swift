//
//  ViewController.swift
//  EncodingGuest
//
//  Created by Papa, John L on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var firstText: UITextField!
  @IBOutlet var lastText: UITextField!
  @IBOutlet var toggle: UISwitch!
  
  var documents: String = ""
  var writePath: String = ""
  var guest: Guest = Guest()
  var data: NSData? = nil
  
  @IBAction func clearUIButton(sender: UIButton) {
    firstText.text = ""
    lastText.text = ""
    toggle.on = false
  }
  
  @IBAction func readFromFileButton(sender: UIButton) {
    // Read the encoded dog from a file
    let rawDataFromFile = NSData(contentsOfFile: writePath)!
    
    // Deencode the data from the file into dog3
    let newGuest = NSKeyedUnarchiver.unarchiveObjectWithData(rawDataFromFile) as! Guest
    print("read in the guest = \(newGuest.first)")
    firstText.text = newGuest.first
    lastText.text = newGuest.last
    toggle.on = newGuest.firstVisit
  }
  
  @IBAction func writeToFileButton(sender: UIButton) {
    do {
      try! data!.writeToFile(writePath, options: [])
    }
  }
  
  @IBAction func encodeButton(sender: UIButton) {
    if let f = firstText.text, let l = lastText.text {
      //TODO: create new guests as you go
      guest.first = f ?? ""
      guest.last = l ?? ""
      guest.firstVisit = toggle.on
      data = NSKeyedArchiver.archivedDataWithRootObject(guest)
      data!.length
      print("*** data.length ***")
      print("bytes length = \(data!.length)")
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] // as? String
    writePath = "\(documents)/guest-data.dat"
    print(writePath)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}




import UIKit

class Guest: NSObject, NSCoding {
  var first: String? = nil
  var last: String? = nil
  var firstVisit: Bool = false
  
  override init() {
  }
  
  init(first: String, last: String, firstVisit: Bool) {
    self.first = first
    self.last = last
    self.firstVisit = firstVisit
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.first = aDecoder.decodeObjectForKey("first") as? String
    self.last = aDecoder.decodeObjectForKey("last") as? String
    self.firstVisit = aDecoder.decodeBoolForKey("firstVisit")
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.first, forKey: "first")
    aCoder.encodeObject(self.last, forKey: "last")
    aCoder.encodeBool(self.firstVisit, forKey: "firstVisit")
  }
}
//
//// Create a Dog that can encode
//let dog = Dog()
//dog.name = "sally"
//dog.age = 3
//print(dog.name!)
//
//// Encode the Dog
//let data = NSKeyedArchiver.archivedDataWithRootObject(dog)
//data.length
//print("*** data.length ***")
//print("bytes length = \(data.length)")
//
//// Deencode the dog into dog2
//let dog2 = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Dog
//print(dog2.name!)
//
//// Write the encoded dog to a file
//let documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] // as? String
//let writePath = "\(documents)/data.dat"
//print(writePath)
//do {
//  try! data.writeToFile(writePath, options: [])
//}
//
//// Read the encoded dog from a file
//let rawDataFromFile = NSData(contentsOfFile: writePath)!
//print("length is still = \(rawDataFromFile.length)")
//
//// Deencode the data from the file into dog3
//let dog3 = NSKeyedUnarchiver.unarchiveObjectWithData(rawDataFromFile) as! Dog
//print(dog3.name!)




