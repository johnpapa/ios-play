//
//  ViewController.swift
//  ShowDelayedStrings
//
//  Created by Papa, John L on 7/27/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var msgLabel: UILabel!
  let places = ["Rivendell", "Mordor", "Dol Guldor", "Erebor", "Gondor", "The Shire", "The Prancing Pony", "Orthanc"];

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func goButton(sender: UIButton) {
    delayIt(0)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func delayIt(i: Int) {
    let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC)))
    if i < places.count {
      let place = String(self.places[i])
      dispatch_after(delay, dispatch_get_main_queue()) {
        print("delayed \(place)")
        self.msgLabel.text = place
        self.delayIt(i+1)
      }
    } else {
      print("done!")
      self.msgLabel.text = "That's all folks!"
    }
  }

}

