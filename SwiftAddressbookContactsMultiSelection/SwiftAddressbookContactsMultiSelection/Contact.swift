//
//  Contact.swift
//  SwiftAddressbookContactsMultiSelection
//
//  Created by Terry Bu on 5/1/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import UIKit

class Contact: NSObject {
   
    var firstName: String
    var lastName: String
    var mobileNumber: String?
    
    init(firstName: String, lastName: String, mobileNumber: String) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.mobileNumber = mobileNumber;
    }
    
}
