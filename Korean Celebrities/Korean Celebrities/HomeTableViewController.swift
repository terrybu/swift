//
//  HomeTableViewController.swift
//  Korean Celebrities
//
//  Created by Terry Bu on 6/8/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import UIKit

class HomeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView:UITableView!
    var allShows = [TVShow]()
    var selectedCeleb: Celebrity?

    override func viewDidLoad() {
        super.viewDidLoad()

        var runningMan = TVShow(name: "Running Man", cast: nil);
        var manyo = TVShow(name: "마녀사냥", cast: nil);
        var radioStar = TVShow(name: "Radio Star", cast: nil);
        
        var yjs = Celebrity(name: "Yoo Jae Suk", currentShow: runningMan, age: 42);
        var kjk = Celebrity(name: "Kim Jong Gook", currentShow: runningMan, age: 40);
        var sjh = Celebrity(name: "Song Ji Hyo", currentShow: runningMan, age: 33);
        var haha = Celebrity(name: "Haha", currentShow: runningMan, age: 37);
        var gary = Celebrity(name: "Kang Gary", currentShow: runningMan, age: 39);
        var kwangSoo = Celebrity(name: "Lee Kwang Soo", currentShow: runningMan, age: 29);
        
        var gura = Celebrity(name: "Kim Gu Ra", currentShow: radioStar, age: 43);
        var kyuHyun = Celebrity(name: "Jo Kyu Hyun", currentShow: radioStar, age: 27);
        
        var dong = Celebrity(name: "Shin Dong Yup", currentShow: manyo, age: 43);
        var sikyung = Celebrity(name: "Sung Si Kyung", currentShow: manyo, age: 37);
        
        runningMan.cast = [yjs, kjk, sjh, haha, gary, kwangSoo]
        radioStar.cast = [gura, kyuHyun]
        manyo.cast = [dong, sikyung]
        
        allShows = [runningMan, radioStar, manyo]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return allShows.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allShows[section].name
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allShows[section].cast!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TerryCustomCell = tableView.dequeueReusableCellWithIdentifier("TerryCustomCell") as! TerryCustomCell
        
        cell.nameLabel!.text = allShows[indexPath.section].cast![indexPath.row].name;
        let imageName = allShows[indexPath.section].cast![indexPath.row].imageName;
        cell.celebImageView!.image = UIImage(named: imageName!);
        
        return cell;
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "celebDetailSegue" {
            var celebVC = segue.destinationViewController as! CelebDetailViewController
            let indexPath = tableView.indexPathForSelectedRow()
            selectedCeleb = allShows[indexPath!.section].cast![indexPath!.row]
            celebVC.celeb = selectedCeleb;
        }
    }


}
