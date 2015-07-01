//
//  CustomViewController.swift
//  testSwoft
//
//  Created by Terry Bu on 6/30/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

    var stringsArray: [String] = []
    var vc: ViewController?
    var objectsArray : [SwiftTerryObject] = []

    init(strings: [String], vc: ViewController, objectsArray: [SwiftTerryObject])
    {
        super.init(nibName: nil, bundle: nil)
        self.stringsArray = strings
        self.vc = vc
        self.objectsArray = objectsArray
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //put a breakpoint here below and step over
        self.stringsArray.append("change")
        //you will see that this VC's stringsArray is now different from home vc's stringsArray. Weird!
        
        //whether it's changing an element in the array or appending, those two arrays are completely different
        self.stringsArray[0] = "changeAroo"
        //old vc's initial index element will still be "hi" after this. Only this VC will have an array with first element "changeAroo"
        
        //let's test with objects because I understand that values are copied directly but objects are just copied in their references
        println(self.objectsArray)
        
        self.objectsArray.append(SwiftTerryObject(name: "extra"))
        println(self.objectsArray)
        //whatever got added in this vc's array don't get reflected back to original VC's array
        //whatever gets deleted from this array don't affect original vc's object array either
        //Objective-C acted differently because the NSArray was passed around by reference, it was never copied
        //Now, Arrays are Structs and copied between view controllers
        self.objectsArray.removeAtIndex(0)
        
        var pointer = self.objectsArray[0]
        pointer.name = "changed"
        //however, since all the objects were copied by their pointers into this new array,
        //if we make a change to that object inside that array, it WILL get reflected back in the old VC
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
