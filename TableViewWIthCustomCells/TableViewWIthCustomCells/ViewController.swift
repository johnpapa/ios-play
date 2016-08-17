//
//  ViewController.swift
//  TableViewWIthCustomCells
//
//  Created by Papa, John L on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class Movie {
  var title: String = ""
  var subtitle: String = ""
  
  init(title: String, subtitle: String) {
    self.title = title
    self.subtitle = subtitle
  }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var movies: [Movie] = [
    Movie(title: "The Force Awakens", subtitle: "Episode VII"),
    Movie(title: "The Return of the Jedi", subtitle: "Episode VI"),
    Movie(title: "The Empire Strikes Back", subtitle: "Episode V"),
    Movie(title: "A New Hope", subtitle: "Episode IV"),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let appcell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath) as! CustomCell_TableViewCell
    
    var idx: Int = 0
    
    if indexPath.section == 0 {
      idx = indexPath.row
    }

    appcell.label1?.text = movies[idx].title
    appcell.label2?.text = movies[idx].subtitle
    
    return appcell
  }

  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Star Wars Movies"
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    
    // total row count goes here
    
    return movies.count
  }

}

