//: [Previous](@previous)

import Foundation
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let url = NSURL(string: "http://swapi.co/api/films/7")!

let request = NSMutableURLRequest(URL:url)

let session = NSURLSession.sharedSession()

NSLog("Starting")

let task = session.dataTaskWithURL(url) { (data, response, error) in
  if let response = response {
    print("Data encoding: \(response.textEncodingName)")
  }
  if let error = error {
    NSLog("Got an error!: \(error.localizedDescription)")
  } else if let data = data {
    NSLog("Got \(data.length) bytes.")
    let str = String(data: data, encoding: NSISOLatin1StringEncoding)
    print("*** Here are the string contents:")
    print(str)
    print("*** ***")
    
    let options = NSJSONReadingOptions()
    do {
      let json = try NSJSONSerialization.JSONObjectWithData(data, options: options) as? [String: AnyObject]
      if let json = json {
        print("*** Here is the JSON")
        print(json)
        print("*** ***")
      }
    }
    catch (let parsingError) {
      print(parsingError)
    }
    
  }
  
  NSLog("Done")
  XCPlaygroundPage.currentPage.finishExecution()
}

task.resume()


