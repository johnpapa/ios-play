//
//  ViewController.swift
//  CameraDemo
//
//  Created by Papa, John L on 7/28/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class CameraController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet var imageView: UIImageView!
  var imagePicker: UIImagePickerController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func getPhoto(sender: UIButton) {
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
    
    alert.addAction(UIAlertAction(title: "Choose existing photo", style: .Default) {
      action in
      self.choosePhotoFromLibrary()
      })
    
    alert.addAction(UIAlertAction(title: "Take photo", style: .Default) {
      action in
      self.takePhoto()
      })
    
    alert.modalPresentationStyle = UIModalPresentationStyle.Popover
    alert.popoverPresentationController?.sourceView = sender

    alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
//    {
//      action in alert.dismissViewControllerAnimated(true, completion: nil)
//    }
    
    self.presentViewController(alert, animated: true, completion: nil)
  }
  
  func takePhoto() {
    if UIImagePickerController.isSourceTypeAvailable(
      UIImagePickerControllerSourceType.Camera) {
      
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .Camera
      
      self.presentViewController(imagePicker, animated: true,
                                 completion: nil)
    }
  }
  
  func imagePickerController(imagePicker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    imagePicker.dismissViewControllerAnimated(true, completion: nil)
    let image = info[UIImagePickerControllerOriginalImage] as? UIImage
    imageView!.image = image
  }
  
  func choosePhotoFromLibrary() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .PhotoLibrary
    
    self.presentViewController(imagePicker, animated: true, completion: nil)
  }
}

