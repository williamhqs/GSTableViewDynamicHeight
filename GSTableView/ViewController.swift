//
//  ViewController.swift
//  GSTableView
//
//  Created by 胡秋实 on 6/19/15.
//  Copyright (c) 2015 William Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var offScreenCells: NSMutableDictionary! = NSMutableDictionary()
    var datas = ["nihaosf sad fsad fasd fas fsaf sdf sad fas","Unlike Objective-C, the elements of an array must be of the same type. In the examples above, implicit typing can deduce that the static array is a string array and the dynamic is an integer array. We can declare an array of a given type by placing the element’s type in square brackets. An integer dynamic array would look like this:"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Humm, this is not neessary is you want to support IOS 8+
        if NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1 {
            self.tableView.estimatedRowHeight = 80
            self.tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("comments_cell") as! GSTableViewCell
        
        self.configureBasicCell(cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        /*If you just want to support ios8+,
        
        return UITableViewAutomaticDimension
        
        only.
        */
        
        if NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1 {
            return UITableViewAutomaticDimension
        }
        
        return self.heightForBasicCellAtIndexPath(indexPath)
    }
    
    
    /********All methods below is not necessary if you want to support ios8+ ***********/
    
    func calculateHeightForConfiguredSizingCell(cell: GSTableViewCell) -> CGFloat {
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let height = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingExpandedSize).height + 1.0
        return height
        
    }
    func configureBasicCell(cell: GSTableViewCell, atIndexPath indexPath:NSIndexPath){
        cell.content.preferredMaxLayoutWidth = CGRectGetWidth(tableView.bounds)
        cell.content.text = datas[indexPath.row]
    }
    
    func heightForBasicCellAtIndexPath(indexPath: NSIndexPath)-> CGFloat {
        var cell = self.offScreenCells.objectForKey("kkk") as? GSTableViewCell
        if cell == nil {
            cell = tableView.dequeueReusableCellWithIdentifier("comments_cell") as? GSTableViewCell
            self.offScreenCells.setObject(cell!, forKey: "kkk")
        }
        self.configureBasicCell(cell!, atIndexPath: indexPath)
        return self.calculateHeightForConfiguredSizingCell(cell!)
    }
    
    
}
