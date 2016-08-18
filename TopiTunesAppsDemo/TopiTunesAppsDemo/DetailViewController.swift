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
  @IBOutlet var summaryLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    if let closure = self.getData {
      itunesApp = closure()
//      print(itunesApp!.title)
//      print(itunesApp!.summary)
      self.titleLabel.text = itunesApp!.title
      self.summaryLabel.text = itunesApp!.summary
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
