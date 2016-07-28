//
//  ViewController.swift
//  DataDemo
//
//  Created by Papa, John L on 7/28/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet var myTableView: UITableView?
  var attractions: [Attraction] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    attractions.append(Attraction(name: "Tea Cups"))
    attractions.append(Attraction(name: "Haunted Mansion"))
    attractions.append(Attraction(name: "Space Mountain"))
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.attractions.count;
    
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
    
    cell.textLabel!.text = self.attractions[indexPath.row].name
    
    print("You selected cell #\(indexPath.row)!")
    
    return cell
  }
  
  
  
}

class Attraction {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

