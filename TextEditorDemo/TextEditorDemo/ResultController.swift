//
//  ResultController.swift
//  TextEditorSample
//
//  Created by Clark, Brian on 7/29/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    
    @IBOutlet var resultText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        resultText.text = nil
        print("\(#function) first view controller")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        resultText.text = InputText.currentText.text
        if InputText.currentText.fontColor == nil {
            InputText.currentText.fontColor = UIColor.blackColor()
        }
        resultText.textColor = InputText.currentText.fontColor!
        resultText.font = resultText.font.fontWithSize(InputText.currentText.fontSize!)
        print("\(#function) first view controller")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
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
