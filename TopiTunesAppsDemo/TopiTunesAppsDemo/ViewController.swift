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
  
  @IBOutlet var overlayView: UIView!
  @IBOutlet var tableView: UITableView!
  @IBOutlet var stepper: UIStepper!
  @IBOutlet var limitLabel: UILabel!
  
  @IBAction func stepChange(sender: UIStepper) {
    limit = Int(stepper.value)
    limitLabel.text = String(limit)
  }
  
  @IBAction func getDataButton(sender: UIButton) {
    apps = []
    
    // http://rss.itunes.apple.com/us/?urlDesc=%2Fgenerator
    let url = NSURL(string: "https://itunes.apple.com/us/rss/topgrossingapplications/limit=\(limit)/json")!
    
    let session = NSURLSession.sharedSession()
    
    self.overlayView.hidden = false
    let task = session.dataTaskWithURL(url) { (data, response, error) in
      if let data = data {
        if let response = response {
          print("Data encoding: \(response.textEncodingName)")
        }
        
        if let error = error {
          NSLog("Got an error!: \(error.localizedDescription)")
          self.overlayView.hidden = true
          return
        }
        
        do {
          NSLog("Got \(data.length) bytes.")
          let str = String(data: data, encoding: NSISOLatin1StringEncoding)
          
          print("*** Here are the string contents:")
          print(str)
          print("*** ***")
          
          let httpResponse = response as! NSHTTPURLResponse
          let statusCode = httpResponse.statusCode
          
          if (statusCode == 200) {
            print("Status code = \(statusCode)")
            print("Everyone is fine, file downloaded successfully.")
            
            let possibleJson = self.parseJson(data)
            if let json = possibleJson {
              print(json["feed"])
              print(json["feed"]!.dynamicType)
              
              guard let dict = json["feed"] as? NSDictionary else { return }
              guard let entries = dict["entry"] as? NSArray else { return }
              
              for entry in entries {
                // Loop through the crap and create apps
                guard let e =  entry as? NSDictionary else { continue }
                let iTunesApp = self.parseAndCreateITunesApp(e)
                self.apps.append(iTunesApp!)
              }
              
              dispatch_async(dispatch_get_main_queue()) {
                print(self.apps[0].title)
                self.tableView.reloadData()
                self.overlayView.hidden = true
              }
            }
          }
        }
      }
      else if let error = error {
        let message = "unable to load the apps. \(error.localizedDescription)"
        NSLog(message)
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
    }
    task.resume()
  }
  
  func parseAndCreateITunesApp (entryDict: NSDictionary) -> ITunesApp? {
    // guard let entryDict = entry as? NSDictionary else { return nil }

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
  
  func parseJson(data: NSData) -> [String: AnyObject]? {
    let options = NSJSONReadingOptions()
    do {
      let json = try NSJSONSerialization.JSONObjectWithData(data, options: options) as? [String: AnyObject]
      if let json = json {
        print("*** Here is the JSON")
        print(json)
        print("*** ***")
      }
      return json
    }
    catch (let parsingError) {
      print(parsingError)
    }
    return nil
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.overlayView.hidden = true
    stepper.value = Double(limit)
    limitLabel.text = String(limit)
    tableView.estimatedRowHeight = 44.0
    tableView.rowHeight = UITableViewAutomaticDimension
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
    let appname = apps[idx].title // TODO: check for null
    print(appname)

    //title
    appcell.appTitle?.text = apps[idx].title
    //price
    let p = apps[idx].price == 0.0 ? "Free" : String(apps[idx].price)
    appcell.appPrice?.text = p
    //developer
    appcell.appDeveloper?.text = apps[idx].developer
    let url: String = (NSURL(string: apps[idx].imageUrl)?.absoluteString)!
    
    // Get the image url
    NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!, completionHandler: { (data, response, error) -> Void in
      if error != nil {
        print(error)
        return
      }
      
      dispatch_async(dispatch_get_main_queue(), { // () -> Void in
        let image = UIImage(data: data!)
        appcell.appImageView?.image = image
        //        appcell.layoutSubviews() // We don't need this here, but if we have rendering issues, we can
      })
    }).resume()
    
    return appcell
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
