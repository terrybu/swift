//
//  ViewController.swift
//  MLPTextFieldTestSwift
//
//  Created by Terry Bu on 6/12/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MLPAutoCompleteTextFieldDelegate, MLPAutoCompleteTextFieldDataSource, UITextFieldDelegate {

    
    override func loadView() {
        
        var MLPTextField = MLPAutoCompleteTextField(frame: CGRectMake(0, 0, 200, 50))
        MLPTextField.delegate = self
        MLPTextField.autoCompleteDelegate = self
        MLPTextField.autoCompleteDataSource = self
        
        self.view.addSubview(MLPTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func autoCompleteTextField(textField: MLPAutoCompleteTextField!, possibleCompletionsForString string: String!, completionHandler handler: (([AnyObject]!) -> Void)!) {
        
        var queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        dispatch_async(queue, {
            if(true){
                var seconds = arc4random_uniform(4)+arc4random_uniform(4); //normal distribution
                sleep(seconds);
            }
            
            var completions = self.allStrings()
            var testWithAutoCompleteObjectsInsteadOfStrings = false
            if(testWithAutoCompleteObjectsInsteadOfStrings){
//                completions = [self allClientObjects];
            }
            
            handler(completions as [AnyObject]);
            });
    }
    
    func allStrings() -> NSArray {
        var strings = ["hi", "bye", "fdasjf"]
        
        return strings;
    }
    
}

