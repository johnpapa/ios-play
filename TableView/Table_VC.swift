//
//  Table_VC.swift
//  TableView
//
//  Created by Papa, John L on 8/15/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class Table_VC: UITableViewController { // , UITableViewDelegate, UITableViewDataSource {
  
  let data: [(name: String, age: Int)] = [
    (name: "John", age: 25),
    (name: "Brian", age: 17),
    (name: "Mary", age: 43),
    (name: "Keith", age: 4)
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
        
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    
    // grouped vertical sections of the tableview
    
    return 2
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    
    // total row count goes here ..., but we are hard coding to 2 jsut so we can put 2 rows in each section
    
    return 2 //data.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    // at init/appear ... this runs for each visible cell that needs to render
    
    let cell = tableView.dequeueReusableCellWithIdentifier("easy_cell", forIndexPath: indexPath)
    
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
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "Section 1"
    } else {
      return "Section 2"
    }
    
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
   if editingStyle == .Delete {
   // Delete the row from the data source
   tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
   } else if editingStyle == .Insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
