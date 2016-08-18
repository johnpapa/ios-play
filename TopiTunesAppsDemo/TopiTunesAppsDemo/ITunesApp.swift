//
//  ITunesApp.swift
//  TopiTunesAppsDemo
//
//  Created by John Papa on 8/17/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import Foundation

class ITunesApp {
  var title: String = ""
  var imageUrl: String = ""
  var summary: String = ""
  
  init(title: String, imageUrl: String, summary: String) {
    self.title = title
    self.imageUrl = imageUrl
    self.summary = summary
  }
}