//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Papa, John L on 7/27/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
  
  var buttonBeep: AVAudioPlayer?
  var imagePicker: UIImagePickerController!
  
  @IBOutlet var drawingCanvas:CustomView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    //    let singleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(_:)))
    
    // Single Tap
    
    let singleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(_:)))
    singleTapRecognizer.numberOfTapsRequired = 1
    //    self.view.addGestureRecognizer(singleTapRecognizer)
    drawingCanvas!.addGestureRecognizer(singleTapRecognizer)
    
    // Double Tap
    let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
    doubleTapRecognizer.numberOfTapsRequired = 2
    //    self.view.addGestureRecognizer(doubleTapRecognizer)
    drawingCanvas!.addGestureRecognizer(doubleTapRecognizer)
    singleTapRecognizer.requireGestureRecognizerToFail(doubleTapRecognizer)
    
    buttonBeep = self.getAVPlayerFor("Purr", type: "aiff")
    
    // Pan
    let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
    //    self.view.addGestureRecognizer(pan)
    drawingCanvas!.addGestureRecognizer(pan)
  }
  
  func handlePanGesture(gesture:UIPanGestureRecognizer) {
    let place = gesture.locationInView(self.view)
    
    switch gesture.state {
    case .Began:
      print("Pan Began \(place)")
    case .Ended:
      print("Pan Ended \(place)")
    default:
      print("Pan - dunno \(place)")
    }
  }
  
  func getAVPlayerFor(fileName: NSString, type: NSString) -> AVAudioPlayer? {
    let path = NSBundle.mainBundle().pathForResource(fileName as String, ofType: type as String)
    let url = NSURL.fileURLWithPath(path!)
    
    var audioPlayer: AVAudioPlayer?
    do {
      try audioPlayer = AVAudioPlayer(contentsOfURL: url)
    } catch {
      print("player not available")
    }
    
    return audioPlayer
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func handleSingleTap(gesture: UITapGestureRecognizer) {
    print("tap")
    buttonBeep?.play()
    
    // Get the location of the tap
    let location = gesture.locationInView(drawingCanvas!)
    drawingCanvas!.xToDraw = location.x
    drawingCanvas!.yToDraw = location.y
    drawingCanvas!.setNeedsDisplay() // tells it to refresh the display (redraw it)
  }
  
  func handleDoubleTap(gesture: UITapGestureRecognizer) {
    print("tap tap")
  }
  
}

