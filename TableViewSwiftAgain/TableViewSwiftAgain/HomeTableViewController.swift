//
//  HomeTableViewController.swift
//  TableViewSwiftAgain
//
//  Created by Terry Bu on 5/19/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

import UIKit

class HomeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    //note how you name protocols in swift now, almost like declaring the class, just add comma
    //adding uitableviewdatasource as protocol will throw compiler error red until you add functions
    //numberofrowsinsection and cellforrowatindexpath
    
    //Adding Properties
    @IBOutlet var tableView: UITableView!
    var tableDataArray = ["Lebron", "Curry", "Wade", "Ginobili", "Jordan", "Payton", "Duncan", "Westbrook", "Durant"];
    let searchController = UISearchController(searchResultsController: nil);
    var filteredResultsArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad();
        
        searchController.searchResultsUpdater = self;
        searchController.searchBar.sizeToFit(); //if you don't do this, you don't see searchbar for some reason
//        controller.dimsBackgroundDuringPresentation = false //if you don't like dimming

        self.tableView.tableHeaderView = searchController.searchBar;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active {
            return filteredResultsArray.count
        }
        else{
            return tableDataArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        if searchController.active {
            cell.textLabel?.text = filteredResultsArray[indexPath.row]
        }
        else{
            cell.textLabel?.text = tableDataArray[indexPath.row]
        }
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("\(tableDataArray[indexPath.row]) was clicked");
    }
    
    
    //Delegate Methods
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filteredResultsArray.removeAll(keepCapacity: false);
        let mySearchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text)
        filteredResultsArray = (tableDataArray as NSArray).filteredArrayUsingPredicate(mySearchPredicate) as! [String];
        tableView.reloadData();
    }
    
    
}
