//
//  CustomCell_TableViewCell.swift
//  TableViewWIthCustomCells
//
//  Created by Papa, John L on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit

class CustomCell_TableViewCell: UITableViewCell {
  
  @IBOutlet var label1: UILabel!
  @IBOutlet var label2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
