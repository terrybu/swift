//
//  HistoryTableViewDataSource.swift
//  Trackerati
//
//  Created by Clayton Rieck on 5/22/15.
//  Copyright (c) 2015 The Hackerati. All rights reserved.
//

import Foundation
import UIKit

class HistoryTableViewDataSource : NSObject, UITableViewDataSource
{
    private let kCellReuseIdentifier = "cell"
    
    private weak var tableView: UITableView!
    var tableViewData = ["alex", "james", "stephen", "dwyane", "jamal", "chris"]
    
    init(tableView: UITableView)
    {
        super.init()
        self.tableView = tableView
        self.tableView.registerClass(HistoryTableViewCell.self, forCellReuseIdentifier: kCellReuseIdentifier)
        
    }
    
    
    // MARK: UITableView Datasource
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
      
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellReuseIdentifier, forIndexPath: indexPath) as! HistoryTableViewCell
        var stringToFill = tableViewData[indexPath.row];
        cell.setValuesForRecord(stringToFill);
        return cell
    }
    
}
