//
//  ViewController.swift
//  HelloWorld2
//
//  Created by Papa, John L on 8/15/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class Home_VC: UIViewController {
  
  @IBOutlet var textMessage: UITextField!;
  @IBOutlet var outputLabel: UILabel!;
  
  @IBAction func buttonOK(sender: UIButton) {
    let userText: String = "Hello " + textMessage.text!
    outputLabel.text = userText
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

