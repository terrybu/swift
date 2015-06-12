//
//  ViewController.swift
//  test
//
//  Created by Terry Bu on 6/12/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

