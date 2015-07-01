//
//  TVShow.swift
//  Korean Celebrities
//
//  Created by Terry Bu on 6/8/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import Foundation

class TVShow {
    var name: String
    var cast: [Celebrity]?
    
    init(name: String, cast: [Celebrity]?) {
        self.name = name;
        self.cast = cast;
    }
    
}