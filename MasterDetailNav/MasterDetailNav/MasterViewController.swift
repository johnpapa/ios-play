//
//  ViewController.swift
//  MasterDetailNav
//
//  Created by Papa, John L on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var guests: [Guest] = [
    Guest(name: "John", age: 22),
    Guest(name: "Colleen", age: 43),
    Guest(name: "Haley", age: 20),
    Guest(name: "Madelyn", age: 17),
    Guest(name: "Ella", age: 12),
    Guest(name: "Landon", age: 32)
  ]
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // grouped vertical sections of the tableview
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    // total row count goes here
    return guests.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    // at init/appear ... this runs for each visible cell that needs to render
    let appcell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath)
    let i: Int = indexPath.row
 
    appcell.textLabel?.text = "\(guests[i].name!) - \(String(guests[i].age!))"
    
    appcell.accessoryType = .DisclosureIndicator
    
    return appcell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let detail = self.storyboard!.instantiateViewControllerWithIdentifier("detailViewController") as! DetailViewController
    
    self.navigationController?.pushViewController(detail, animated: true)
    
    detail.getData = { [ weak self ] in
      return self!.guests[ indexPath.row ]
    }

    detail.updateData = { [ weak self ] (guest: Guest) in
      self!.guests[indexPath.row] = guest
      self?.tableView?.reloadData()
    }
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Numbers"
  }
}
