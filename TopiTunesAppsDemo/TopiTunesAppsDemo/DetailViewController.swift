//
//  DetailViewController.swift
//  TopiTunesAppsDemo
//
//  Created by Papa, John L on 8/18/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  var getData: (() -> (ITunesApp))?
  var iTunesApp: ITunesApp? = nil
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var summaryTextView: UITextView!
  @IBOutlet var overlayView: UIView!
  @IBOutlet var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.overlayView.hidden = true
    if let closure = self.getData {
      iTunesApp = closure()
      displayDetails()
    }
  }
  
  func displayDetails() {
    if let iTunesApp = iTunesApp {
      self.titleLabel.text = iTunesApp.title
      self.summaryTextView.text = iTunesApp.summary
      getScreenshots()
    }
  }
  
  func getScreenshots() {
    let session = NSURLSession.sharedSession()
    let appDetailsUrls = NSURL(string: "https://itunes.apple.com/lookup?id=" + iTunesApp!.id)!
    self.overlayView.hidden = false
    let task = session.dataTaskWithURL(appDetailsUrls) { (data, response, error) in
      if let data = data {
        if let error = error {
          NSLog("Got an error!: \(error.localizedDescription)")
          self.overlayView.hidden = true
          return
        }
        
        do {
          let httpResponse = response as! NSHTTPURLResponse
          let statusCode = httpResponse.statusCode
          if (statusCode == 200) {
            let possibleJson = JSONParser.parseJson(data)
            if let json = possibleJson {
              guard let results = json["results"] as? NSArray else { return }
              guard let screenshotUrls = results[0]["screenshotUrls"] as? NSArray else { return }
              
              dispatch_async(dispatch_get_main_queue()) {
                for url in screenshotUrls {
                  //TODO: load the images
                  print(url)
                }
                self.collectionView.reloadData()
                self.overlayView.hidden = true
              }
            }
          }
        }
      }
      else if let error = error {
        let message = "unable to load the apps. \(error.localizedDescription)"
//        self.displayAlertView(message)
      }
    }
    task.resume()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
