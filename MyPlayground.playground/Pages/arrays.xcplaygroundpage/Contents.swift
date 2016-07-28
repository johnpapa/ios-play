import Foundation

// Looping and arrays

print("*** Looping and arrays")
var characters = ["Captain America", "Hulk", "Thor"]
print(characters[2])
print(characters.first!, characters.last!)

characters = characters.reverse()
characters.count

print("For loop with indexer --> Characters ")
for index in 0..<characters.count {
  print("\(index). \(characters[index])")
}

print("For loop with enumerator --> Characters ")
for (i, member) in characters.enumerate() {
  print("\(i+1). \(member)")
}


let x2 = [10, 3, 20, 15, 4]
  .sort()
  .filter { $0 > 5 }
  .map { $0 * 100 }
//  .map(x => x * 100) // this wont work, cuz its typescript

// these also work
//  .map({ number in
//      return number * 100
//  })
//
//  .map({ (number:Int) ->Int in
//    return number * 100
//  })


print("Here are the numbers after the chained expression \(x2)")

var emptyArray0: [String] // shows nil
var emptyArray1 = [String]()
var emptyArray2: [String] = []
var emptyArray3: [Any] = []
var emptyArray4: [AnyObject] = []
var emptyArray5 = [] // shows ( )
var emptyArray6: NSArray = [] // shows ( )
var emptyArray7: [NSObject] = []
var emptyArray8 = ["joe", "pete"]
var emptyArray9: Any = [] // or 8 or whatever

if emptyArray5 == emptyArray6 {
  print("these equal")
}


// Array sorting
var names3: Array<String> = ["john", "brian", "pam", "bob"];
func backwards(s1: String, _ s2: String) -> Bool {
  return s1 > s2
}
var reversed = names3.sort(backwards)

var names = ["john", "brian", "pam", "bob", 777];
names.count

var names2: Array<String> = ["john", "brian", "pam", "bob"];
//var names2: [String] = ["john", "brian", "pam", "bob"];
names2.count

let someDictionary: [String: Int] = ["Alex": 31, "Paul": 39]
let someDictionary2: Dictionary<String, Int> = ["Alex": 31, "Paul": 39]

