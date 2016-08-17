//
//  ViewController.swift
//  MasterDetailNav
//
//  Created by Papa, John L on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var numbers: [Int] = [3,4,5,62,3]
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    
    // grouped vertical sections of the tableview
    
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    
    // total row count goes here
    
    if section == 0 {
      //
    }
    return numbers.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    // at init/appear ... this runs for each visible cell that needs to render
    
    let appcell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath)
    
    var idx: Int = 0
    
    if indexPath.section == 0 {
      idx = indexPath.row
    }
 
    appcell.textLabel?.text = String(numbers[idx])
    
    return appcell
  }
  
  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
      print("hit this row!")
    let detail = self.storyboard!.instantiateViewControllerWithIdentifier("detailViewController") as! DetailViewController
    
    
    
    self.navigationController?.pushViewController(detail, animated: true)
  }
  
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Numbers"
  }

}

