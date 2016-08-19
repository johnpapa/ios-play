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
  var itunesApp: ITunesApp? = nil
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var summaryTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    if let closure = self.getData {
      itunesApp = closure()
      self.titleLabel.text = itunesApp!.title
      self.summaryTextView.text = itunesApp!.summary
      
      // Ratings url
//      let ratingUrl = NSURL(string: "https://itunes.apple.com/lookup?id=" + localData!.id!)!

    }
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
