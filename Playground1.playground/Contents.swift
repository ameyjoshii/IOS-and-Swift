import UIKit
import Darwin
import Foundation

/*var greeting = "Hello, playground"
for _ in 1...10 {
    print("\(greeting)")
}

class Bike {
    var name : String?
    var gear = 10
    
    func student(name: String) -> String? {
       return name
    }
    
}
var b: Bike? = Bike()
b = Bike()
if let value = b?.student(name: "Amey"){
    print("\(value)")
}

let person = (name: "Paul", age: 35)
print("\(person.1)")


struct Person {
    let clothes: String
    let shoes: String
}

let p = Person(clothes: "Shirt", shoes: "Nike")
print("\(p.clothes)")

let b = Bike()
print("\(b.gear)")
b.name = "FZ5"
//print("\(b.name!)")

if let value = b.name {
        print("\(value)")
    }

class Student {
    var name: String
    var age: Int
    var rollno: Int
    var marks: Int
    
    init(){                                         //Default Initializing
        name = ""
        age = 0
        rollno = 0
        marks = 0
    }
    
    func studentinfo(){
        /*
         if let value1 = name, let value2 = age, let value3 = rollno{
            print("\(value1),\(value2),\(value3)")
         }
         */
    }
}

let s1 = Student()
s1.age = 18
s1.name = "Alex"
s1.rollno = 01
s1.marks = 80

let s2 = Student()
s2.name = "Jack"
s2.age = 19
s2.rollno = 05
s2.marks = 60

enum marks: Int {
    case A = 90
    case B = 80
    case C = 70
    case D = 60
}

var m1 = marks(rawValue: s2.marks)

switch m1 {
    case .A:
        print("Grade A")
    case .B:
        print("Grade B")
    case .C:
        print("Grade C")
    default:
        print("Grade D")
    
}

class vehicle{
    var current_speed = 0.0
    var description: String{
        return "travelling at \(current_speed) Km/hr"
    }
}

s1.studentinfo()
s2.studentinfo()

enum names {
   case Swift
   case Closures
}

var lang = names.Closures
lang = .Closures

switch lang {
   case .Swift:
      print("Welcome to Swift")
   /*case .Closures:
      print("Welcome to Closures")*/
   default:
      print("Introduction")
}

enum Suit: String {
    case spades = "♠"
    case hearts = "♥"
    case diamonds = "♦"
    case clubs = "♣"
}

let s = Suit(rawValue: "♥")

switch s {
   case .hearts:
      print("Welcome to Swift")
   case .Closures:
      print("Welcome to Closures")
   default:
      print("Introduction")
}*/


// 03/02/22


protocol Color: AnyObject{
    func setColor(_ color: String)
}

class Draw{
    weak var delegate: Color?
    func finishDrawing() {
        delegate?.setColor("yellow color")
    }
}

class Pencil: Color{
    let d = Draw()
    func display(){
        d.delegate = self
        d.finishDrawing()
    }
    func setColor(_ color: String) {
        print("Pencil is of" + " \(color)")
    }
}

let p = Pencil()
p.display()
