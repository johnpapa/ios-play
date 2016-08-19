//
//  ViewController.swift
//  WebKitDemo
//
//  Created by Papa, John L on 8/18/16.
//  Copyright © 2016 Papa, John L. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
  
  var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let subView = WKWebView(frame: self.view.bounds)
    subView.navigationDelegate = self
    subView.backgroundColor = UIColor.grayColor()
    self.webView = subView
    self.webView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(self.webView)
    
    let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
      "H:|-0-[myview]-0-|",
      options: [],
      metrics: nil,
      views: ["myview": self.webView])
    self.view.addConstraints(horizontalConstraints)

    let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
      "V:|-0-[myview]-0-|",
      options: [],
      metrics: nil,
      views: ["myview": self.webView])
    self.view.addConstraints(verticalConstraints)

    
    // NSLayoutConstraint
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    loadHtmlPage()
  }
  
  func loadHtmlPage() {
    if let url = NSURL(string: "https://www.google.com") {
      let request = NSURLRequest(URL: url)
      self.webView.loadRequest(request)
    }
  }
  
  func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
    NSLog(#function)
  }
  
  func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
    NSLog(#function)
  }
  
  func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
    NSLog(#function)
  }
  
  func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    NSLog(#function)
  }
  
  func webView(webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
    NSLog(#function)
  }
  
  func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
    NSLog(#function)
  }
  
  func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
    NSLog(#function)
    if (navigationAction.navigationType == .LinkActivated){
      decisionHandler(.Cancel)
    } else {
      decisionHandler(.Allow)
    }
  }
  
  func webView(webView: WKWebView, decidePolicyForNavigationResponse navigationResponse: WKNavigationResponse, decisionHandler: (WKNavigationResponsePolicy) -> Void) {
    NSLog(#function)
      decisionHandler(.Allow)
  }
  
  func webView(webView: WKWebView, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge, completionHandler: (NSURLSessionAuthChallengeDisposition, NSURLCredential?) -> Void) {
    NSLog(#function)

//    if challenge.protectionSpace.host == "https://unimol.esse3.cineca.it/auth/Logon.do" {
//      let user = "*******"
//      let password = "******"
//      let credential = NSURLCredential(user: user, password: password, persistence: NSURLCredentialPersistence.ForSession)
//      challenge.sender?.useCredential(credential, forAuthenticationChallenge: challenge)
//    }
    let credential = NSURLCredential(user: "user", password: "password", persistence:     NSURLCredentialPersistence.ForSession)
    completionHandler(NSURLSessionAuthChallengeDisposition.UseCredential, credential)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

