//
//  CustomView.swift
//  GestureRecognizer
//
//  Created by Papa, John L on 7/28/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
  var points = [Point]()
  var xToDraw:CGFloat? // current points captured
  var yToDraw:CGFloat?
  var iWantCircle = true
  
  override func drawRect(rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    
    let blue = UIColor.blueColor().CGColor
    let purple = UIColor.purpleColor().CGColor
    
    // Setting the fill color to purple
    CGContextSetFillColorWithColor(context, purple)
    // Filling the current rect (everything) to purple
    CGContextFillRect(context, rect)

    // Change the color to blue
    CGContextSetFillColorWithColor(context, blue)
    if let xToDraw = xToDraw, yToDraw = yToDraw {

      points.append(Point(x: xToDraw, y:yToDraw))
      
      for p in points {
        if iWantCircle {
          let diameter = CGFloat(50.0)
          let x = p.x - (diameter/2.0)
          let y = p.y - (diameter/2.0)
          let circleRect = CGRect(x: x, y: y, width: diameter, height: diameter)
          CGContextSetFillColorWithColor(context, blue)
          CGContextFillEllipseInRect(context,  circleRect)
        } else {
          let pointRec = CGRect(x: p.x, y: p.y, width: 10.0, height: 10.0)
          // Set the dot to blue (small rect)
          CGContextFillRect(context, pointRec)
        }
      }
    }
  }
}


// draw 1 thing at a time
//class CustomView: UIView {
//  var xToDraw:CGFloat?
//  var yToDraw:CGFloat?
//  var iWantCircle = true
//  
//  override func drawRect(rect: CGRect) {
//    let context = UIGraphicsGetCurrentContext()
//    
//    let blue = UIColor.blueColor().CGColor
//    let purple = UIColor.purpleColor().CGColor
//    
//    // Setting the fill color to purple
//    CGContextSetFillColorWithColor(context, purple)
//    // Filling the current rect (everything) to purple
//    CGContextFillRect(context, rect)
//    
//    // Change the color to blue
//    CGContextSetFillColorWithColor(context, blue)
//    if xToDraw != nil {
//      if iWantCircle {
//        let diameter = CGFloat(50.0)
//        let x = xToDraw! - (diameter/2.0)
//        let y = yToDraw!-(diameter/2.0)
//        let circleRect = CGRect(x: x, y: y, width: diameter, height: diameter)
//        CGContextSetFillColorWithColor(context, blue)
//        CGContextFillEllipseInRect(context,  circleRect)
//      } else {
//        let pointRec = CGRect(x: xToDraw!, y: yToDraw!, width: 10.0, height: 10.0)
//        // Set the dot to blue (small rect)
//        CGContextFillRect(context, pointRec)
//      }
//    }
//  }
//}
