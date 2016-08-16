//
//  ViewController.swift
//  AutoLayout
//
//  Created by Papa, John L on 8/16/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var label: UILabel!
  
  @IBAction func topLeftPushed(sender: UIButton) {
    label.text = "top left pushed"
  }
  @IBAction func topRightPushed(sender: UIButton) {
    label.text = "top right pushed"
  }
  @IBAction func bottomLeftPushed(sender: UIButton) {
    label.text = "bottom left pushed"
  }
  @IBAction func bottomRightPushed(sender: UIButton) {
    label.text = "bottom right pushed"
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

