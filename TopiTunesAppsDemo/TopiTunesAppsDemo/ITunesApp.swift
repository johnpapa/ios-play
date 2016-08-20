//
//  ITunesApp.swift
//  TopiTunesAppsDemo
//
//  Created by John Papa on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import Foundation

class ITunesApp {
  var id: String = ""
  var title: String = ""
  var imageUrl: String = ""
  var summary: String = ""
  var price: Double = 0.0
  var developer: String = ""
  var screenshotUrls: [String] = []
  
  init(id: String, title: String, imageUrl: String, summary: String, price: Double, developer: String) {
    self.id = id
    self.title = title
    self.imageUrl = imageUrl
    self.summary = summary
    self.price = price
    self.developer = developer
  }
}