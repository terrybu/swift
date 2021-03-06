//
//  HistoryViewController.swift
//  Trackerati
//
//  Created by Clayton Rieck on 5/21/15.
//  Copyright (c) 2015 The Hackerati. All rights reserved.
//

import UIKit

class HistoryViewController : MainViewController, UITableViewDelegate, HistoryTableViewCellDelegate
{
    private weak var historyTableView: UITableView!
    private var historyTableViewDataSource: HistoryTableViewDataSource!
    
    override func loadView() {
        super.loadView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Trash, target: self, action: "editTableView")
        
        let historyTableView = UITableView(frame: view.frame, style: .Plain)
        historyTableView.delegate = self
        historyTableViewDataSource = HistoryTableViewDataSource(tableView: historyTableView)
        historyTableView.dataSource = historyTableViewDataSource
        view.addSubview(historyTableView)
        self.historyTableView = historyTableView
    }
    
    
    // MARK: UIBarButtonItem Selectors
    
    @objc
    private func editTableView()
    {
        historyTableView.setEditing(!historyTableView.editing, animated: true)
    }
    
    @objc
    private func dismissForm()
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UITableView Delegate
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // Set delegate of cell here since datasource is separated out
        (cell as? HistoryTableViewCell)?.delegate = self
    }
    
    // Disables default UITableView swipe to delete. HistoryCell has own custom delete button
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing {
            return .Delete
        }
        
        return .None
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! HistoryTableViewCell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return HistoryTableViewCell.cellHeight
    }
    
    // MARK: HistoryTableViewCell Delegate
    
    func didPressDeleteButton(cell: HistoryTableViewCell) {
        if let cellIndexPath = self.historyTableView.indexPathForCell(cell) {
            println(self.historyTableViewDataSource.tableViewData[cellIndexPath.row]);
        }
    }
    
    func didPressEditButton(cell: HistoryTableViewCell) {
        if let cellIndexPath = self.historyTableView.indexPathForCell(cell) {
            println(self.historyTableViewDataSource.tableViewData[cellIndexPath.row]);
        }
    }
    
}
