//
//  ViewController.swift
//  ObjectSwiftMixProject
//
//  Created by Terry Bu on 5/13/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var person = ObjectivePerson();
        
        person.useThatSwiftObject();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

