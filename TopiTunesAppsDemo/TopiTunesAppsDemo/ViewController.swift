//
//  ViewController.swift
//  TopiTunesAppsDemo
//
//  Created by Papa, John L on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var apps: [App] = []
  var limit: Int = 2 // default
  
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
    
    print("Starting")
    
    let task = session.dataTaskWithURL(url) { (data, response, error) in
      if let response = response {
        print("Data encoding: \(response.textEncodingName)")
      }
      
      if let error = error {
        NSLog("Got an error!: \(error.localizedDescription)")
        return
      }
      
      if let data = data {
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
            
            // This does not run ... we will learn more about getting json from background to ui thread later.
            
            guard let dict = json["feed"] as? NSDictionary else { return }
            guard let entries = dict["entry"] as? NSArray else { return }
            
            print(dict["entry"])
            
            for entry in entries {
              guard let entryDict = entry as? NSDictionary else { continue }
              
              guard let titleDict = entryDict["title"] as? NSDictionary else { continue }

              guard let label = titleDict["label"] as? String else { continue }
              
              print("*** label = \(label ?? " ")")

              guard let images = entryDict["im:image"] as? NSArray else { continue }
              let image = images[0]
              let imageUrl = image["label"]!! as! String // TODO: Why bang bang?
              print("image url = \(imageUrl)")
              

              self.apps.append(App(title: label, imageUrl: imageUrl))
            }
            
            dispatch_async(dispatch_get_main_queue()) {
              print(self.apps[0].title)
              self.tableView.reloadData()
            }
            
          }
        }
      }
    }
    task.resume()
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
    stepper.value = Double(limit)
    limitLabel.text = String(limit)
//    self.tableView.delegate = self
//    self.tableView.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    
    // grouped vertical sections of the tableview
    
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    
    // total row count goes here
    
    if section == 0 {
      //
    }
    return apps.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    // at init/appear ... this runs for each visible cell that needs to render
    
    let appcell = tableView.dequeueReusableCellWithIdentifier("appnamecell", forIndexPath: indexPath)
//    let imagecell = tableView.dequeueReusableCellWithIdentifier("imagecell", forIndexPath: indexPath)
    
    var idx: Int = 0
    
    if indexPath.section == 0 {
      idx = indexPath.row
    }
    
//    if (idx == 0) {
      // app name
      let appname = apps[idx].title
      
      print(appname)
      
      appcell.textLabel?.text = appname
      
      return appcell
//    } else {
//      // image
//      let imageUrl = apps[idx].imageUrl
//      
//      imagecell.textLabel?.text = imageUrl
//      
//      return imagecell
//    }
    
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      //
    }
    return "Apps"    
  }


}

class App {
  var title: String = ""
  var imageUrl: String = ""
  
  init(title: String, imageUrl: String) {
    self.title = title
    self.imageUrl = imageUrl
  }
}