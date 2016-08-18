//
//  SecondViewController.swift
//  TabSharedData
//
//  Created by Papa, John L on 8/18/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet var tableView: UITableView!
  var people = [Person]()
  
  func dataChanged(notification: NSNotification) {
    getData()
    tableView.reloadData()
  }
  
  func getData() {
    people = DataService.shared.get( {$0.age > 20} )
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell")
    cell?.textLabel?.text = String(people[indexPath.row].age)
    return cell!
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    getData()
    let ncenter = NSNotificationCenter.defaultCenter()
    ncenter.addObserver(self, selector: #selector(dataChanged(_:)), name: DATA_CHANGED.name, object: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
