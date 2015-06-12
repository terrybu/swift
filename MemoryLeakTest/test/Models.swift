//
//  Models.swift
//  test
//
//  Created by Terry Bu on 6/12/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import Foundation

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