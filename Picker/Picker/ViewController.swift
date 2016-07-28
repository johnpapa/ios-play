//
//  ViewController.swift
//  Picker
//
//  Created by Papa, John L on 7/28/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  @IBOutlet var resortPicker: UIPickerView!
  @IBOutlet var datePicker: UIDatePicker!
  @IBOutlet var label: UILabel!
  
  var resorts: [String] = [
    "Beach Club",
    "Yacht Club",
    "Boardwalk"
  ]

  // ************************************
  // INSTRUCTIONS
  // list of disney resorts
  // date must be between now and 1 year out
  // picker chooses a resort
  // label that changes when the user chooses a resort and date
  // bonus: use NSDateFormatter for date formatting
  // hint: UIDatePicker is a control, no delegate. Use the value changed event with in IBAction
  // ************************************
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Connect data:
//    self.resortPicker?.delegate = self
//    self.resortPicker?.dataSource = self
    
    self.datePicker.minimumDate = NSDate()
    self.datePicker.maximumDate = NSDate(timeIntervalSinceNow: 3600*24*365)
  }
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return resorts.count
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    print("resorts[row] = \(resorts[row])")
    formatMessage()
  }
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return resorts[row]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func dateValueChanged(sender: UIDatePicker) {
    print("Date is now \(sender.date)")

    formatMessage()
  }
  
  func formatMessage() {
    let resort = resorts[resortPicker!.selectedRowInComponent(0)]

    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle =  .ShortStyle //NSDateFormatterStyle.ShortStyle
    let vacationDate = dateFormatter.stringFromDate(datePicker.date)
    
    let msg = "\(resort) on \(vacationDate)"
    label?.text = msg
  }

  
}

