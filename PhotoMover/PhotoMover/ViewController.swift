//
//  ViewController.swift
//  PhotoMover
//
//  Created by Papa, John L on 7/27/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var xSlider: UISlider!
  @IBOutlet var ySlider: UISlider!
  @IBOutlet var xLabel: UILabel!
  @IBOutlet var yLabel: UILabel!
  @IBOutlet var movingImage: UIImageView!
  
  var startingX = 20.0
  var startingY = 100.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    xSlider.minimumValue = 0
    xSlider.maximumValue = 200
    ySlider.minimumValue = 125
    ySlider.maximumValue = 500
    setXValue(Float(startingX))
    setYValue(Float(startingY))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func sliderXValueChanged(sender: UISlider) {
    setXValue(sender.value)
  }

  @IBAction func sliderYValueChanged(sender: UISlider) {
    setYValue(sender.value)
  }
  
  func setXValue(x: Float) {
    xLabel.text = String(x)
    movingImage.frame.origin.x = CGFloat(x)
  }

  func setYValue(y: Float) {
    yLabel.text = String(y)
    movingImage.frame.origin.y = CGFloat(y)
  }


}

