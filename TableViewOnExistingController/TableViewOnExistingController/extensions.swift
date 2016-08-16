//
//  extensions.swift
//  TableViewOnExistingController
//
//  Created by Papa, John L on 8/16/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import Foundation
import UIKit

extension String {
  func toCGFloat() -> CGFloat {
    return CGFloat(Float(self)!)
  }
}

extension UIColor {
  var components: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    var r, g, b, a: CGFloat
    r = 0.0
    g = 0.0
    b = 0.0
    a = 0.0
    self.getRed(&r, green: &g, blue: &b, alpha: &a)
    return (r, g, b, a)
  }
}