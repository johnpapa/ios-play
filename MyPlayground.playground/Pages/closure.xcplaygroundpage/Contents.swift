import UIKit
import Foundation

func printSomething() {
  print("Something")
}

var printThis = printSomething

printThis()

var doSomethingWithAnInt: Int -> Int

func multiplyByTwo(number: Int) -> Int {
  return number*2
}

doSomethingWithAnInt = multiplyByTwo

doSomethingWithAnInt(24)


func runThisClosure(num: Int, closure: Int -> Void) {
  closure(num)
}

runThisClosure(400) { (aNumber) in
  print("The number I have is \(aNumber)")
}
// this is the same as the above
runThisClosure(400, closure: { (aNumber) in
  print("The number I have is \(aNumber)")
})

func runASimpleClosure (closure: Void -> Void) {
  closure()
}

func someLongMethod() {
  print("There will be lots of code here")
}

var variableClosure: Void -> Void

variableClosure = {
  print("This is a variable closure")
}

runASimpleClosure(variableClosure)

runASimpleClosure{
  () in
  print("this is a bit of code")
}

// closure (with parameter) taking function
func iTakeClosureThatTakesAnInt (closure: Int -> Void) {
  let x = 7
  closure(x)
}


iTakeClosureThatTakesAnInt { (x) in
  print("1st way - calling a closure with an arg " + String(x))
}
iTakeClosureThatTakesAnInt() { (x) in
  print("2nd way - calling a closure with an arg " + String(x))
}
iTakeClosureThatTakesAnInt( { (x) in
  print("3rd way - calling a closure with an arg " + String(x))
})

// closure (with parameter) taking function
// also has a arg for the func
func iTakeIntAndClosureThatTakesAnInt (number: Int, closure: Int -> Void) {
  closure(number)
}

iTakeIntAndClosureThatTakesAnInt(17) { (x) in
  print("calling a closure with an arg " + String(x))
}

// closure (with parameter) taking function
// also has a arg for the func
func wickedClosureRunner (msg: String, number: Int, closure: (Int, Double) -> String) {
  let result = closure(10, 12.7)
  print("\(msg) number: \(number) closureResult: \(result)")
}


wickedClosureRunner("Hello", number: 17) { (x, y) -> String in
  return "product of what you gave me is \(Double(x) * y)"
}






func moreClosuresWithARgs(strings: [String], closure: Int -> String) {
  for (i, string) in strings.enumerate() {
    print("\(string), \(closure(i))")
  }
}

moreClosuresWithARgs(["John", "Brian", "Pam"]) { (x) -> String in
  return "The number \(x) squared is \(x*x)"
}



let names: [String] = ["John", "Brian", "Pam", "Giovanni", "Aragorn"]

let shortNames = names.filter {
  (x) -> Bool in
  return x.characters.count <= 4
}


var ages = [12,45,23,65,77,3,90,123,234,12,2345,123,567,345]
var youngAges = ages.filter{
  (x) in
  return x < 50
}
print("young ones = \(youngAges.count)")
var overHundred = ages.filter {
  (x) in
  return x > 100
}
print("over 100 = \(overHundred)")

var places = ["Rivendell", "Gondor", "Dol Guldor", "Mordor", "The Shire"]
var sortedPlaces = places.sort{
  (x1, x2) in
  return x1 < x2
}
print("sortedPlaces = \(sortedPlaces)")

var placeLengths = places.map {
  (p) in
  return p.characters.count
}
print("placeLengths = \(placeLengths)")







