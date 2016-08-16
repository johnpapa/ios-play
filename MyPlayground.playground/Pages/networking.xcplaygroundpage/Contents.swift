//: [Previous](@previous)

import Foundation
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let url = NSURL(string: "http://swapi.co/api/films/7")!

let session = NSURLSession.sharedSession()

NSLog("Starting")


func parseJson(data: NSData) -> [String: AnyObject]? {
  let options = NSJSONReadingOptions()
  do {
    let json = try NSJSONSerialization.JSONObjectWithData(data, options: options) as? [String: AnyObject]
    if let json = json {
      print("*** Here is the JSON")
      print(json)
      print("*** ***")
      
      if let movieTitle = json["title"] {
        print("Movie title = \(movieTitle)")
      } else {
        print("No Movie title exists")
      }
    }
    
    return json
  }
  catch (let parsingError) {
    print(parsingError)
  }
  return nil
}


let task = session.dataTaskWithURL(url) { (data, response, error) in
  if let response = response {
    print("Data encoding: \(response.textEncodingName)")
  }

  if let error = error {
    NSLog("Got an error!: \(error.localizedDescription)")
    return
  }
  
  if let data = data {
    NSLog("Got \(data.length) bytes.")
    let str = String(data: data, encoding: NSISOLatin1StringEncoding)

    print("*** Here are the string contents:")
    print(str)
    print("*** ***")
    
    let httpResponse = response as! NSHTTPURLResponse
    let statusCode = httpResponse.statusCode
    
    if (statusCode == 200) {
      print("Status code = \(statusCode)")
      print("Everyone is fine, file downloaded successfully.")

      parseJson(data)
    }
  }
  
  NSLog("Done")
  XCPlaygroundPage.currentPage.finishExecution()
}

task.resume()
