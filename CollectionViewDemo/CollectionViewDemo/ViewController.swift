//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Papa, John L on 8/19/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class MyCustomCell: UICollectionViewCell {
  @IBOutlet var label1: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 10
  }

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("mycustomcell", forIndexPath: indexPath) as! MyCustomCell
    cell.label1.text = "\(indexPath.section), \(indexPath.item)"
    return cell
  }
}

