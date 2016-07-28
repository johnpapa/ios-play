//
//  ViewController.swift
//  MovingTest
//
//  Created by Papa, John L on 7/27/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var textLabel: UILabel!
  @IBOutlet var xSlider: UISlider!
  @IBOutlet var ySlider: UISlider!
  @IBOutlet var xLabel: UILabel!
  @IBOutlet var yLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    xSlider.value = 20.0
    ySlider.value = 200.0
    setLabelX(String(xSlider.value))
    setLabelY(String(ySlider.value))
    print("view did load")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func moveButon(sender: UIButton) {
    print("move to \(Double(xSlider.value))  \(Double(ySlider.value))")
    
//    let textFrame = CGRect(x: Double(xSlider.value), y: Double(ySlider.value), width: 100,height: 21)
//    textLabel.frame = textFrame;
    
    textLabel.frame.origin.x = CGFloat(xSlider.value)
    textLabel.frame.origin.y = CGFloat(ySlider.value)
    
    delayIt(0)
  }
  
  @IBAction func xSliderValueChanged(sender: UISlider) {
    setLabelX(String(sender.value))
  }
  
  @IBAction func ySLiderValueChanged(sender: UISlider) {
    setLabelY(String(sender.value))
  }
  
  func setLabelX(x: String) {
    print("slider x \(x)")
    xLabel.text = x
  }

  func setLabelY(y: String) {
    print("slider y \(y)")
    yLabel.text = y
  }
  
  var nums = [1,4,6,8,9]
  
  func delayIt(i: Int) {
    let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC)))
    
    if i < nums.count {
      dispatch_after(delay, dispatch_get_main_queue()) {
        print("delayed \(String(self.nums[i]))")
        self.delayIt(i+1)
      }
    }
  }
}

