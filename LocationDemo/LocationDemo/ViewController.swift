//
//  ViewController.swift
//  LocationDemo
//
//  Created by Papa, John L on 8/18/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
  
  var locationManager: CLLocationManager? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    self.locationManager = CLLocationManager()
    self.locationManager?.delegate = self
    self.checkAuthorization()
  }
  
  func findLocation() {
    NSLog("Authorized")
    self.locationManager?.startUpdatingLocation()
  }
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    NSLog("Finding locations ...")
//    NSLog("\(locations)")
    for loc in locations {
      NSLog(loc.description)
    }
    manager.stopUpdatingLocation()
  }
  
  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    NSLog("Failed: \(error.localizedDescription)")
  }
  
  func checkAuthorization() {
    guard CLLocationManager.locationServicesEnabled() else { return }
    let authStatus = CLLocationManager.authorizationStatus()
    NSLog("authStatus \(authStatus)")
    
    switch authStatus {
    case .AuthorizedAlways, .AuthorizedWhenInUse:
      NSLog("auth status is auth always or when in use")
      self.findLocation()
      
    case .Denied, .Restricted:
      NSLog("auth status is denied or restricted")
      return
      
    case .NotDetermined:
      NSLog("auth status is not determined")
      self.locationManager?.requestWhenInUseAuthorization()
    }
  }
  
  func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    NSLog("auth status changed to \(status)")
    self.checkAuthorization()
  }
  
  
}

