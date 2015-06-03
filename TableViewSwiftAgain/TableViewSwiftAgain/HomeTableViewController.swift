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
    var items = ["Lebron", "Curry", "Wade", "Ginobili"];
    let searchController = UISearchController(searchResultsController: nil);

    override func viewDidLoad() {
        super.viewDidLoad();
        
        searchController.searchResultsUpdater = self;
        searchController.searchBar.sizeToFit();
        self.tableView.tableHeaderView = searchController.searchBar;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("\(self.items[indexPath.row]) was clicked");
    }
    
    
    //Delegate Methods
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
    }
    
    
}
