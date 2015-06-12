//: Playground - noun: a place where people can play

import UIKit

class ObjectA {
    let name: String
    var b: ObjectB
    
    init(name: String, b: ObjectB) {
        self.name = name
        self.b = b
    }
    
    deinit {
        print("\(name) deallocated")
    }
}

class ObjectB {
    let name: String
    var randomArrayProperty = [ObjectA]()
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) deallocated")
    }
}

// Create a _possible_ leak. It depends on what we'll do next
var b: ObjectB? = ObjectB(name: "Foo B")
var a: ObjectA? = ObjectA(name: "Bar A", b: b!)
b?.randomArrayProperty.append(a!)

// No leaks
a = nil
// Remove a from array inside b, a will dealloc
b?.randomArrayProperty.removeLast()
b = nil

// Recreate a _possible_ leak.
b = ObjectB(name: "Foo1 B")
a = ObjectA(name: "Bar1 A", b: b!)
b?.randomArrayProperty.append(a!)

// Leaks
a = nil
b = nil