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
    let cell = tableView.dequeueReusableCellWithIdentifier("cell")
    cell?.textLabel?.text = people[indexPath.row].name
    return cell!
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


}

