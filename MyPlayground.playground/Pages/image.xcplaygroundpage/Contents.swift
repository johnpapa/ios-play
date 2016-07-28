import UIKit
import XCPlayground

let frame = CGRect(x: 0.0, y: 0.0, width: 350.0, height: 200.0)
let myView = UIView(frame: frame)
XCPlaygroundPage.currentPage.liveView = myView

myView.backgroundColor = UIColor.purpleColor()
myView.layer.borderWidth = 4.0
myView.layer.borderColor = UIColor.yellowColor().CGColor

let labelFrame = CGRect(x: 20.0, y: 0.0, width: 150, height: 200.0)

let lbl = UILabel(frame: labelFrame)
lbl.text = "Hello there"
lbl.backgroundColor = UIColor.blueColor()
lbl.font = UIFont.systemFontOfSize(20)
lbl.textColor = UIColor.whiteColor()
myView.alpha = 0.9

let imageFrame = CGRect(x: 150.0, y: 0.0, width: 200.0, height: 200.0)
let imageView = UIImageView(frame: imageFrame)
let image = UIImage(named: "mickey.png")
imageView.image = image

myView.addSubview(lbl)
myView.addSubview(imageView)


myView