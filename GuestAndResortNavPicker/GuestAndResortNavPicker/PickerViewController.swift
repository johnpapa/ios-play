//
//  PickerViewController.swift
//  GuestAndResortNavPicker
//
//  Created by Papa, John L on 8/15/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

  @IBOutlet var guestText: UITextField!
  @IBOutlet var resortPicker: UIPickerView!
  
  var resorts: [String] = [
    "Beach Club",
    "Yacht Club",
    "Boardwalk"
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    guestText.text = GuestInfo.currentGuest.guestName ?? ""
    if let resort = GuestInfo.currentGuest.resortName {
      
      let i = resorts.indexOf(resort) ?? 0
      resortPicker.selectRow(i, inComponent: 0, animated: true)
    }

    //    self.resortPicker.dataSource = self;
    //    self.resortPicker.delegate = self;
    // While we can do this above, instead we can select the Picker and drag the delegate and datasource circle outlets to the ViewContrller in the storyboard, too
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1 // number of columns
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return resorts.count // number of rows
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    // this is called when  a row was selected
    let resort = resorts[row]
    print("resorts[row] = \(resort)")
    formatMessage()
//    GuestInfo.currentGuest.resortName = selectedResort
  }
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    // this is called when row is selected, and returns the selected item
    return resorts[row]
  }
  
  func formatMessage() {
    let resort = selectedResort
    
    let msg = "\(resort) was selected"
    print(msg)
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    
    print("Picker View Will Disappear was called")
    
    GuestInfo.currentGuest.guestName = guestText.text
    GuestInfo.currentGuest.resortName = selectedResort
  }

  var selectedResort : String {
    get { return resorts[resortPicker!.selectedRowInComponent(0)] }
  }
  
  // UITextField Delegates
  func textFieldDidBeginEditing(textField: UITextField) {
    print("TextField did begin editing method called")
  }
  func textFieldDidEndEditing(textField: UITextField) {
    print("TextField did end editing method called")
  }
  func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
    print("TextField should begin editing method called")
    return true;
  }
  func textFieldShouldClear(textField: UITextField) -> Bool {
    print("TextField should clear method called")
    return true;
  }
  func textFieldShouldEndEditing(textField: UITextField) -> Bool {
    print("TextField should end editing method called")
    return true;
  }
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    print("While entering the characters this method gets called")
//    let guest = guestText.text
//    GuestInfo.currentGuest.guestName = guest
//    print("Guest name changed to \(string)")
    return true;
  }
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    print("TextField should return method called")
    textField.resignFirstResponder();
    return true;
  }
  
}
