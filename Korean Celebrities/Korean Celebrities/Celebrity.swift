//
//  Celebrity.swift
//  Korean Celebrities
//
//  Created by Terry Bu on 6/8/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import Foundation

class Celebrity {
    
    var name: String
    weak var currentShow: TVShow?
    var age: Int?
    var imageName: String?
   
    init(name: String, currentShow: TVShow, age: Int) {
        self.name = name;
        self.currentShow = currentShow;
        self.age = age;
        var noSpacesName = name.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions(), range: nil);
        noSpacesName.replaceRange(noSpacesName.startIndex...noSpacesName.startIndex, with:String(noSpacesName[noSpacesName.startIndex]).lowercaseString);
        self.imageName = noSpacesName;
        
    }
    
}
