//
//  ViewController.swift
//  HelloWorld
//
//  Created by Papa, John L on 7/26/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var displayNameText: UITextField!
  @IBOutlet var displayMessageLabel: UILabel!
  @IBOutlet var buttonOK: UIButton!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var mySlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func mySliderValueChanged(sender: UISlider) {
    imageView?.alpha = CGFloat(sender.value)
  }
  @IBAction func buttonOKTapped(sender: UIButton) {
    displayMessageLabel.text = "Hello, \(displayNameText.text!)"
  }
}

