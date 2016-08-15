//: [Previous](@previous)

import Foundation
import UIKit


func tryToWriteToFile(path: String, data: String) -> Bool {
//  let path = "/usr/bin"
  let encodedData = data.dataUsingEncoding(NSASCIIStringEncoding)
  print(encodedData?.length)

  do {
    try encodedData?.writeToFile(path, options: [])

    // Can't change encoding
//    try data?.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
    return true
  }
  catch (let error as NSError) {
    print("Error saving file at path: \(path) with error: \(error)")
  }
  return false
}

tryToWriteToFile("/usr/bin/bar.txt", data: "Some data to write to a file")


//// to get the docs dir
func getDocumentsDirectory() -> NSString {
  let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
  let documentsDirectory = paths[0]
  return documentsDirectory
}


