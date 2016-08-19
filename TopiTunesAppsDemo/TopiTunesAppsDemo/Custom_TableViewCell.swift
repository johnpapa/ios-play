//
//  Custom_TableViewCell.swift
//  TopiTunesAppsDemo
//
//  Created by Papa, John L on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class Custom_TableViewCell: UITableViewCell {
  
  @IBOutlet var appImageView: UIImageView!
  @IBOutlet var appTitle: UILabel!
  @IBOutlet var appDeveloper: UILabel!
  @IBOutlet var appPrice: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
