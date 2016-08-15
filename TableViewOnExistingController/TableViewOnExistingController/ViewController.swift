//
//  ViewController.swift
//  TableViewOnExistingController
//
//  Created by Papa, John L on 8/15/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var data: [(name: String, age: Int)] = [
    (name: "John", age: 25),
    (name: "Brian", age: 17),
    (name: "Mary", age: 43),
    (name: "Keith", age: 4)
  ]

  var i: Int = 50
  
  @IBOutlet var changeDataButton: UIButton!
  @IBOutlet var tableView: UITableView!
  
  @IBAction func buttonClicked(sender: UIButton) {
    print("button was clicked")
    i = i + 1
    data.append((name: "new value \(i)", age: i))
    self.tableView.reloadData()
  }

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
    
    return 2
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    
    // total row count goes here ..., but we are hard coding to 2 jsut so we can put 2 rows in each section
    
    if section == 0 {
      // put 2 rows here
      return 2
    } else {
      // put all the rest of the rows here
      return data.count - 2
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    // at init/appear ... this runs for each visible cell that needs to render
    
    let cell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath)
    
    var idx: Int = 0
    
    if indexPath.section == 1 {
      idx = 2 + indexPath.row
    } else {
      // this is section  0
      idx = indexPath.row
    }
    
    let str = data[idx].name + " : \(data[idx].age) "
    
    print(str)
    
    cell.textLabel?.text = str
    return cell
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "Section 1"
    } else {
      return "Section 2"
    }
    
  }

}

