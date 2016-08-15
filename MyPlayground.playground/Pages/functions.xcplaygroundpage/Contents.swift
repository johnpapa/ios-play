import Foundation
import UIKit

func logIt(msg: String = "fake log") {
  print(msg)
}
logIt()
logIt("Hello World")

print("*** Function without optionals")

var temp:Float = 76.0
var thermostat:Float = 70.0
var furnanceRunning = false
var acRunning = false

func turnStuffOnOrOff(temp: Float) {
  if temp < thermostat {
    furnanceRunning = true
  }
  if temp > thermostat {
    acRunning = true
  }
  print("At \(temp) degrees")
  print("Furnance is running = \(furnanceRunning)")
  print("AC is running = \(acRunning)")
}

turnStuffOnOrOff(100)
turnStuffOnOrOff(50)

print("*** Function with optionals")

var normal = 1;
var optional: Int? = 2;
var optional2: Optional<Int> = 2;
var implicitlyUnwrappedOptional: Int! = 3;
var implicitlyUnwrappedOptional2: ImplicitlyUnwrappedOptional<Int> = 3;

var temp2:Float? = nil
var thermostat2:Float? = nil
var furnanceRunning2: Bool? = nil
var acRunning2: Bool? = nil

func turnStuffOnOrOff2(temp: Float? = nil) {
  if temp < thermostat2 {
    furnanceRunning2 = true
  }
  if temp > thermostat2 {
    acRunning2 = true
  }
  print("At \(temp) degrees")
  print("Furnance is running = \(furnanceRunning2)")
  print("AC is running = \(acRunning2)")
}

turnStuffOnOrOff2()
turnStuffOnOrOff2(100)
turnStuffOnOrOff2(50)

print("yet another way with optionals")

var temp3: Float? = 76.0
var therm3: Float? = 70.0
var furnaceOn: Bool? = nil
var acOn: Bool? = nil

if let temp = temp3, therm = therm3 {
  if temp < therm - 3.0 {
    furnaceOn = true
  } else if temp > therm + 3.0 {
    acOn = true
  }
  print("At \(temp) degrees")
  print("Furnance is running = \(furnaceOn)")
  print("AC is running = \(acOn)")
}

// Functions
print("*** Functions ")

func printChris(foo lastName: String, age: Int) -> String {
  let name = "Chris \(lastName) is \(age) years old"
  print(name)
  return name;
}

printChris(foo: "Jones", age: 33)

func printChris(lastName: String, age: Int = 21) -> String {
  let name = "Chris \(lastName) is \(age) years old"
  print(name)
  return name;
}

printChris("Jones", age: 34)

printChris("Jones")


func printChris2(lastName: String, _ age: Int) -> String {
  let name = "Chris \(lastName) is \(age) years old"
  print(name)
  return name;
}

printChris2("Brian", 11)



func hypotenuse(a: Float, b: Float) -> Float {
  return sqrt(a * a + b * b)
}

func sumOneToN(a: Int) -> Int {
  return (a * a + a) / 2
}

print(sumOneToN(4))
print(sumOneToN(1))


// Functions and named and unamed parameters
func foo1(x: Int, _ y: Int) {
  print(x + y)
}
func foo2(x: Int, y: Int) {
  print(x + y)
}

foo1(4, 7)
foo2(4, y: 7)



func handleTemp(temp: Float?) {
  let thermostat: Float? = 70.0
  var furnaceOn: Bool? = nil
  var acOn: Bool? = nil
  
  if let temp = temp, therm = thermostat {
    if temp < therm - 3.0 {
      furnaceOn = true
    } else if temp > therm + 3.0 {
      acOn = true
    } else {
      furnaceOn = false
      acOn = false
    }
    print("At \(temp) degrees")
    print("Furnance is running = \(furnaceOn)")
    print("AC is running = \(acOn)")
  }
}

handleTemp(99)

func calculateSalesTax(price: Double) -> Double {
  let taxRate = price < 100 ? 1.07 : price < 1000 ? 1.08 : 1.09
  return price * taxRate
}

print(calculateSalesTax(10))
print(calculateSalesTax(100))
print(calculateSalesTax(1000))

func retire(startingAmt: Double, years: Int) -> Double {
  let myReturn = 1.07
  if years > 1 {
    return (startingAmt + retire(startingAmt, years: years - 1)) * myReturn
  } else {
    return startingAmt * myReturn
  }
}

print(retire(1000, years: 10))



print("optional quiz")
var color: UIColor? = nil
//color = UIColor.redColor()

//let colorA = color!
let colorB = color?.CGColor
//print(colorA)
print(colorB)


