//
//  InputText.swift
//  TextEditorSample
//
//  Created by Clark, Brian on 7/29/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation
import UIKit

class InputText {
    static let currentText = InputText()
    
    var text: String? = nil
    var fontSize: CGFloat? = CGFloat(12)
    var fontColor: UIColor? = UIColor.blackColor()
}