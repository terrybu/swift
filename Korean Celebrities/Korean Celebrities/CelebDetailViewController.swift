//
//  CelebDetailViewController.swift
//  Korean Celebrities
//
//  Created by Terry Bu on 6/11/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import UIKit

class CelebDetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var ageLabel: UILabel?
    @IBOutlet var showLabel: UILabel!
    @IBOutlet var knownAffiliatesLInput: UILabel?
    
    
    var celeb : Celebrity?
    
    override func viewDidLoad() {
        imageView!.image = UIImage(named:celeb!.imageName!)
        nameLabel!.text = "Name: " + celeb!.name
        ageLabel!.text = "Age: " + String(celeb!.age!)
        showLabel.text = "Current TV Show: " + celeb!.currentShow!.name
    }
    
}
