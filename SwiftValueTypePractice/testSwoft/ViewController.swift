//
//  ViewController.swift
//  testSwoft
//
//  Created by Terry Bu on 6/30/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var strings : [String]?
    var objectsArray : [SwiftTerryObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        strings = ["hi", "b", "fish"]
        var object1 = SwiftTerryObject(name: "a")
        var object2 = SwiftTerryObject(name: "b")
        var object3 = SwiftTerryObject(name: "c")
        objectsArray = [object1, object2, object3]
    }
    
    override func viewWillAppear(animated: Bool) {
        println(strings)
        println(objectsArray)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue" {
            var destinationVC : CustomViewController = segue.destinationViewController as! CustomViewController
            
            destinationVC.stringsArray = self.strings!
            destinationVC.vc = self
            destinationVC.objectsArray = self.objectsArray!
        }
    }
    
    
}

