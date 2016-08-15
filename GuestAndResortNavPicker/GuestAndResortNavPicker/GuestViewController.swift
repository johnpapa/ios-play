//
//  ViewController.swift
//  GuestAndResortNavPicker
//
//  Created by Papa, John L on 8/15/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

/*
 To create navigation ...
 
 1. Editor | Embed in Nav Controller
 2. Drag 2nd view controller into storyboard
 3. Create iOS Cocoa Touch class and name it SubViewController
 4. Select the second VC in the storyboard and asociate it to the new SubViewController
 5. Create button on main controller and Control Drag from it to the SubViewController
 
 */

class GuestViewController: UIViewController {
  
  @IBOutlet var guestTextField: UITextField!
  @IBOutlet var resortTextField: UITextField!
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    print("Guest View Will Appear was called")

    if let guest = GuestInfo.currentGuest.guestName {
      guestTextField.text = guest
    }

    if let resort = GuestInfo.currentGuest.resortName {
      resortTextField.text = resort
    }
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    
    print("Guest View Will Disappear was called")

    GuestInfo.currentGuest.guestName = guestTextField.text
    GuestInfo.currentGuest.resortName = resortTextField.text
    print(GuestInfo.currentGuest.guestName)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

