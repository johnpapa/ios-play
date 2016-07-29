//
//  FontsController.swift
//  TextEditorSample
//
//  Created by Clark, Brian on 7/29/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

class FontsController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var fontSize: UITextField!
    @IBOutlet var colorPicker:UIPickerView!
    var selectedColor:UIColor?
    var colors = ["Red", "Green", "Blue"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch colors[row] {
        case "Red":
            selectedColor = UIColor.redColor()
        case "Blue":
            selectedColor = UIColor.blueColor()
        case "Green":
            selectedColor = UIColor.greenColor()
        default:
            selectedColor = UIColor.blackColor()
            break
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("\(#function) first view controller")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("\(#function) first view controller")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        InputText.currentText.fontSize = CGFloat(Int(fontSize.text!)!)
        InputText.currentText.fontColor = selectedColor
        print("\(#function) first view controller")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(#function) first view controller")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
