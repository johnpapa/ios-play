//
//  DetailViewController.swift
//  TopiTunesAppsDemo
//
//  Created by Papa, John L on 8/18/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
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
          if (httpResponse.statusCode == 200) {
            let possibleJson = JSONParser.parseJson(data)
            if let json = possibleJson {
              guard let results = json["results"] as? NSArray else { return }
              guard let screenshotUrls = results[0]["screenshotUrls"] as? NSArray else { return }
              
              dispatch_async(dispatch_get_main_queue()) {
                for url in screenshotUrls {
                  self.iTunesApp!.screenshotUrls.append(url as! String)
                }
                self.collectionView.reloadData()
                self.overlayView.hidden = true
              }
            }
          }
        }
      }
      else if let error = error {
        let message = "unable to load the screenshots. \(error.localizedDescription)"
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
    self.presentViewController(alertVC, animated: true, completion: nil)
    dispatch_async(dispatch_get_main_queue()) {
      self.overlayView.hidden = true
    }
  }

  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.iTunesApp!.screenshotUrls.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("screenshotCell", forIndexPath: indexPath) as! ScreenshotCollectionViewCell
    displayAppImage(indexPath.item, cell: cell)
    return cell
  }
  
  override func viewWillLayoutSubviews() {
    collectionView.collectionViewLayout.invalidateLayout()
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("screenshotCell", forIndexPath: indexPath) as! ScreenshotCollectionViewCell
//    let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
    return CGSize(width: collectionView.bounds.size.height, height: collectionView.bounds.size.height)
  }
  
  func displayAppImage(row: Int, cell: ScreenshotCollectionViewCell) {
    let url: String = (NSURL(string: self.iTunesApp!.screenshotUrls[row])?.absoluteString)!
    NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!, completionHandler: { (data, response, error) -> Void in
      if error != nil {
        print("error getting screenshot image data: \(error)")
        return
      }
      
      dispatch_async(dispatch_get_main_queue(), {
        let image = UIImage(data: data!)
        cell.screenshotImage.image = image
      })
    }).resume()
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
