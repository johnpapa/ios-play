//
//  ViewController.swift
//  Lifecycle
//
//  Created by Papa, John L on 7/28/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet var nameField: UITextField!
  @IBOutlet var emailField: UITextField!
  @IBOutlet var urlField: UITextField!
  @IBOutlet var ageField: UITextField!
  @IBOutlet var phoneField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(animated: Bool) {
    print("view will appear \(#function)")
  }
  
  override func viewDidAppear(animated: Bool) {
    print("view did appear \(#function)")
  }
  
  override func viewWillDisappear(animated: Bool) {
    print("view will disappear \(#function)")
  }
  
  override func viewDidDisappear(animated: Bool) {
    print("view did disappear \(#function)")
  }
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
  
//    print("replacementstring = \(string)")
//    print("range = \(range)")
//    print("original value = \(textField.text)")
//    print("count = \(textField.text?.characters.count)")
    
    let newString = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
 
    var valid = true
    
    switch textField {
    case nameField:
      valid = newString.characters.count >= 2 && newString.characters.count <= 50

    case urlField:
      let possibleUrl = NSURL(string: newString)
      valid = possibleUrl != nil
    
      //TODO
//    case emailField:
      
    case ageField:
      valid = Int(newString) != nil

    case phoneField:
      valid = newString.characters.count == 7 || newString.characters.count == 10
    
    default:
      print("dunno")
    }
    print("field changed to \(newString)")
    textField.backgroundColor = valid ? UIColor.whiteColor() : UIColor(red: 1.0, green: 0.9, blue: 0.9, alpha: 1.0)
    
    return true
  }
  
  func verifyUrl(urlString: String?) -> Bool {
    // Validate it has http:// too
    let urlRegEx = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*)+)+(/)?(\\?.*)?"
    let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[urlRegEx])
    let urlTest = NSPredicate.predicateWithSubstitutionVariables(predicate)
    print(urlTest);
    return predicate.evaluateWithObject(urlString)
  }
  
}

