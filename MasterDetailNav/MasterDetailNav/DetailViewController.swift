//
//  DetailViewController.swift
//  MasterDetailNav
//
//  Created by Papa, John L on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet var ageText: UITextField!
  @IBOutlet var nameText: UITextField!
  
  var guest: Guest? = nil
  var getData: (() -> (Guest))?
  var updateData: ((guest: Guest) -> ())?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let closure = self.getData {
      guest = closure()
      self.ageText.text = String(guest!.age!)
      self.nameText.text = guest!.name!
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillDisappear(animated: Bool) {
    guard let age = Int(self.ageText.text!) else { return }
    guard let name = self.nameText.text else { return }

    guest!.age = age
    guest!.name = name
    if let updateDataClosure = self.updateData {
      updateDataClosure(guest: guest!)
    }
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
