//
//  FirstViewController.swift
//  TabSharedData
//
//  Created by Papa, John L on 8/18/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBAction func changeDataButton(sender: UIButton) {
    let d = DataService.shared.people[3]
    d.name = "Captain Hook"
    d.age = 777
    DataService.shared.people[3] = d
    let ncenter = NSNotificationCenter.defaultCenter()
    ncenter.postNotification(DATA_CHANGED)
  }
  
  func dataChanged(notification: NSNotification) {
    getData()
    tableView.reloadData()
  }
  
  func getData() {
    people = DataService.shared.get({(p: Person) -> Bool in
      return p.name < "M"
    })
  }
  
  @IBOutlet var tableView: UITableView!
  var people = [Person]()
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
    cell.textLabel?.text = people[indexPath.row].name
    cell.accessoryType = .DisclosureIndicator
    return cell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    getData()
    
    let ncenter = NSNotificationCenter.defaultCenter()
    ncenter.addObserver(self, selector: #selector(dataChanged(_:)), name: DATA_CHANGED.name, object: nil)
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
//  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//    if editingStyle == .Delete {
//      people.removeAtIndex(indexPath.row)
//      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic) // or .Automatic
//    }
//  }
  
  func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    let delete = UITableViewRowAction(style: .Default, title: "Delete It") { action, index in
      print("deleted")
      self.people.removeAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic) // or .Automatic
    }
    delete.backgroundColor = UIColor.redColor()
    
    let more = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "More" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
      print("mored")
      tableView.setEditing(false, animated: true)
    })
    more.backgroundColor = UIColor.blueColor()
    
    return [delete, more]
  }
  
}



