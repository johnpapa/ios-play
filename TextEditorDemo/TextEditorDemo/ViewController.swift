//
//  ViewController.swift
//  TextEditorDemo
//
//  Created by Clark, Brian P. on 7/29/16.
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputTextView:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        InputText.currentText.text = inputTextView.text != nil ? inputTextView.text : ""
        print("\(#function) first view controller")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(#function) first view controller")
    }}

