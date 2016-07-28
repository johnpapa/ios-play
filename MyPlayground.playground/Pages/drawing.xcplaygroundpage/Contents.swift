import Foundation
import UIKit
import XCPlayground

class DrawingView: UIView {
  override func drawRect(rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    
    let green = UIColor.greenColor().CGColor
    let blue = UIColor.blueColor().CGColor
    let purple = UIColor.purpleColor().CGColor
    let yellow = UIColor.yellowColor().CGColor
    let orange = UIColor.orangeColor().CGColor
    
    CGContextSetFillColorWithColor(context, green)
    CGContextFillRect(context, rect)
    
    // draw border around ourself
    
    CGContextSetStrokeColorWithColor(context, blue)
    CGContextSetLineWidth(context, 14.0)
    CGContextStrokeRect(context, rect)
    
    // paint an ellipse
    
    CGContextSetFillColorWithColor(context, blue)
    CGContextFillEllipseInRect(context, rect)
    
    let text = "Khan!!!!!" as NSString
    text.drawAtPoint(CGPoint.zero, withAttributes: [:])

    // Paths
    drawTriangle(context!, color: purple)
    
    drawSquare(context!, color: yellow)
    
    drawPolygon5(context!, color: orange)
    
  }
  
  func drawTriangle(context: CGContext, color: CGColor) {
    let triangle = UIBezierPath()
    CGContextSetStrokeColorWithColor(context, color)
    
    triangle.moveToPoint(CGPoint(x: 0.0, y: 0.0))
    triangle.addLineToPoint(CGPoint(x: 100.0, y: 0.0))
    triangle.addLineToPoint(CGPoint(x: 50.0, y: 100.0))
    triangle.lineWidth = 4.0
    triangle.closePath()
    triangle.stroke()
//    triangle.fill()
  }

  func drawSquare(context: CGContext, color: CGColor) {
    let polygon = UIBezierPath()
    CGContextSetStrokeColorWithColor(context, color)
    
    polygon.moveToPoint(CGPoint(x: 0.0, y: 0.0))
    polygon.addLineToPoint(CGPoint(x: 100.0, y: 0.0))
    polygon.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
    polygon.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
    polygon.lineWidth = 4.0
    polygon.closePath()
    polygon.stroke()
  }

  func drawPolygon5(context: CGContext, color: CGColor) {
    let polygon = UIBezierPath()
    CGContextSetStrokeColorWithColor(context, color)
    
    polygon.moveToPoint(CGPoint(x: 0.0, y: 0.0))
    polygon.addLineToPoint(CGPoint(x: 100.0, y: 0.0))
    polygon.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
    polygon.addLineToPoint(CGPoint(x: 50.0, y: 100.0))
    polygon.addLineToPoint(CGPoint(x: 0.0, y: 50.0))
    
    polygon.lineWidth = 4.0
    polygon.closePath()
    polygon.stroke()
  }
}



let frame = CGRect(x: 0.0, y: 0.0, width: 250.0, height: 200.0)
let myView = DrawingView(frame: frame)

// To show in the drawing in the Assistant Editor pane
XCPlaygroundPage.currentPage.liveView = myView

myView


