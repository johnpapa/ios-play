//
//  ViewController.swift
//  TopiTunesAppsDemo
//
//  Created by Papa, John L on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var apps: [ITunesApp] = []
  var limit: Int = 10 // default
  let refreshControl = UIRefreshControl()
  
  @IBOutlet var overlayView: UIView!
  @IBOutlet var tableView: UITableView!
  @IBOutlet var stepper: UIStepper!
  @IBOutlet var limitLabel: UILabel!
  
  @IBAction func stepChange(sender: UIStepper) {
    limit = Int(stepper.value)
    limitLabel.text = String(limit)
  }
  
  func getITunesData() {
    apps = []
    
    // http://rss.itunes.apple.com/us/?urlDesc=%2Fgenerator
    // toppaidapplications
    // topgrossingapplications
    let url = NSURL(string: "https://itunes.apple.com/us/rss/toppaidapplications/limit=\(limit)/json")!
    
    let session = NSURLSession.sharedSession()
    
    self.overlayView.hidden = false
    let task = session.dataTaskWithURL(url) { (data, response, error) in
      if let data = data {
        if let error = error {
          NSLog("Got an error!: \(error.localizedDescription)")
          self.overlayView.hidden = true
          return
        }
        
        let httpResponse = response as! NSHTTPURLResponse
        let statusCode = httpResponse.statusCode
        if (statusCode == 200) {
          let possibleJson = JSONParser.parseJson(data)
          if let json = possibleJson {
            guard let dict = json["feed"] as? NSDictionary,
              entries = dict["entry"] as? NSArray else {
              self.overlayView.hidden = true
              return
            }
          
            for entry in entries {
              guard let e =  entry as? NSDictionary else { continue }
              let iTunesApp = self.parseAndCreateITunesApp(e)
              self.apps.append(iTunesApp!)
            }
            
            dispatch_async(dispatch_get_main_queue()) {
              self.tableView.reloadData()
              self.overlayView.hidden = true
            }
          }
        }
      }
      else if let error = error {
        let message = "unable to load the apps. \(error.localizedDescription)"
        self.displayAlertView(message)
      }
    }
    task.resume()
  }
  
  func displayAlertView(message: String) {
    let alertVC = UIAlertController(title: "error loading",
                                    message: message,
                                    preferredStyle: .Alert)
    let ok = UIAlertAction(title: "Ok", style: .Default, handler: { (action) in
      NSLog("Ok pressed")
    })
    alertVC.addAction(ok)
    self.presentViewController(alertVC, animated: true, completion: {
      // do something if you want
      // this happens when it is done presenting, not when they have hit OK
    })
    dispatch_async(dispatch_get_main_queue()) {
      self.overlayView.hidden = true
    }
  }
  
  func parseAndCreateITunesApp (entryDict: NSDictionary) -> ITunesApp? {
    // Get the id
    guard let idDict = entryDict["id"] as? NSDictionary else { return nil }
    guard let idAttrDict = idDict["attributes"] as? NSDictionary else { return nil }
    guard let id = idAttrDict["im:id"] as? String  else { return nil }
    
    // Get the title
    guard let titleDict = entryDict["title"] as? NSDictionary else { return nil }
    guard let title = titleDict["label"] as? String else { return nil }
    
    // Get the price
    guard let priceDict = entryDict["im:price"] as? NSDictionary else { return nil }
    guard let priceAttrDict = priceDict["attributes"] as? NSDictionary else { return nil }
    guard let price = Double(priceAttrDict["amount"] as! String) else { return nil }
    // Get the developer
    guard let developerDict = entryDict["im:artist"] as? NSDictionary else { return nil }
    guard let developer = developerDict["label"] as? String else { return nil }
    // Get the summary
    guard let summaryDict = entryDict["summary"] as? NSDictionary else { return nil }
    guard let summary = summaryDict["label"] as? String else { return nil }
    // Get the image
    guard let images = entryDict["im:image"] as? NSArray else { return nil }
    let image = images[0] as! NSDictionary
    let imageUrl = image["label"]! as! String
    
    let iTunesApp = ITunesApp(id: id, title: title, imageUrl: imageUrl, summary: summary, price: price, developer: developer)
    return iTunesApp
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.overlayView.hidden = true
    
    stepper.value = Double(limit)
    limitLabel.text = String(limit)
    tableView.estimatedRowHeight = 44.0
    tableView.rowHeight = UITableViewAutomaticDimension
//    refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
    refreshControl.addTarget(self, action: #selector(refresh), forControlEvents: .ValueChanged)
    tableView.addSubview(refreshControl) // not required when using UITableViewController
    getITunesData()
  }
  
  func refresh(sender:AnyObject)
  {
    getITunesData()
    dispatch_async(dispatch_get_main_queue(), {
      self.tableView.reloadData()
    })
    self.refreshControl.endRefreshing()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // grouped vertical sections of the tableview
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // total row count goes here
    return apps.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    // at init/appear ... this runs for each visible cell that needs to render
    let appcell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath) as! Custom_TableViewCell
    
    let idx: Int = indexPath.row

    //title
    appcell.appTitle?.text = apps[idx].title
    //price
    let p = apps[idx].price == 0.0 ? "Free" : "$" + String(apps[idx].price)
    appcell.appPrice?.text = p
    //developer
    appcell.appDeveloper?.text = apps[idx].developer
    // image
    displayAppImage(idx, appcell: appcell)
    
    return appcell
  }
  
  func displayAppImage(row: Int, appcell: Custom_TableViewCell) {
    let url: String = (NSURL(string: apps[row].imageUrl)?.absoluteString)!
    NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!, completionHandler: { (data, response, error) -> Void in
      if error != nil {
        print(error)
        return
      }
      
      dispatch_async(dispatch_get_main_queue(), {
        let image = UIImage(data: data!)
        appcell.appImageView?.image = image
        //        appcell.layoutSubviews() // We don't need this here, but if we have rendering issues, we can
      })
    }).resume()
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "iTunes Top Apps"
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let detail = self.storyboard!.instantiateViewControllerWithIdentifier("detailViewController") as! DetailViewController
    
    self.navigationController?.pushViewController(detail, animated: true)
    
    detail.getData = { [ weak self ] in
      return self!.apps[ indexPath.row ]
    }
  }
}
