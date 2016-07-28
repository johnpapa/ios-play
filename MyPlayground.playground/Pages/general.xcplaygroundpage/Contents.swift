import UIKit

////////////////////////////////
// Math
////////////////////////////////

4+6

// 31 + (3/0)

7.38 as Int

(4 * 3 * 2) + 1

(-3 + 40)

(50 - -4)

1.25 + 4

4 + 1.25

// Must cast to Float to perform this operation
sqrt(16 as Float)

////////////////////////////////
// Strings
////////////////////////////////
var str = "Hello, playground"

var name = "John";

print("Hello " + name)

"Landon".lowercaseString

("🐅" + "⚽️").characters.count

"⚽️"
var age = 17;

var sentence = "Haley \(age) years old"

let x = 3.14;
// x=33
x + 11

var optionalInteger: Int?

optionalInteger = 42
optionalInteger! // 42

var petCount: Int

var pi: Float = 3.14

if( pi > 3 ) {
  print("pi is bigger than 3")
} else {
  print("pi is not :(")
}

if pi > 3 && 4 > 3 {
  print("pi is bigger than 3")
} else {
  print("pi is not :(")
}


var a: String;
var b: Float;
var c: Int;
// a is "test", b is 12, c is 3, and 9.45 is ignored
(a, _, (b, c)) = ("test", 9.45, (12, 3))

(pi > 2) ? "pi is bigger than 2" : "pi is not bigger :("


var float1 = 2.45
var int1 = 4
let float2 = Float(int1)

var float3: Float = 23.49
print(float3)

var bool1 = 3 != 4
bool1 = (3 == 4) && true

print("joe", names2, separator: "-")


// ? is optional 
// ! is forced


names2.split("-")


print("wildcards")
var x1: Int?;
(x1, _) = (10, 20)
x1
// x is 10, and 20 is ignored


var firstName = "Joe"
var lastName: String? = nil
var fullName: String? // defaults to nil

if lastName != nil {
  fullName = firstName + lastName!
}

// lastName.uppercaseString // this would error
lastName?.uppercaseString
print("Last Name is \(lastName?.uppercaseString)")

lastName = "Smith"
let upper = lastName?.uppercaseString
print(upper)
print(upper!)
print("Last Name is \(lastName?.uppercaseString)")

print(lastName ?? "Unknown name")
lastName = nil
print(lastName ?? "Unknown name")


// unknown, any type
var unknown: Any

struct Circle {
  var x = 0.0
  var y = 0.0
  var radius = 2.0
}

let myCircle = Circle()




func delayIt() {
  let timestamp = dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC)))
  
  dispatch_after(timestamp, dispatch_get_main_queue()) {
    print("We are delayed!")
  }
}

