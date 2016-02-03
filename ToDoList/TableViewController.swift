//
//  TableViewController.swift
//  ToDoList
//
//  Created by Davis Gossage on 2/1/16.
//  Copyright © 2016 Davis Gossage. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ComposeDelegate {
    
    var items = [ToDoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //load in some initial data
        let item1 = ToDoItem()
        item1.itemDescription = "Take out trash"
        item1.done = false
        items.append(item1)
        
        let item2 = ToDoItem()
        item2.itemDescription = "Do laundry"
        item2.done = true
        items.append(item2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("toDoListCell", forIndexPath: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.itemDescription
        
        //note that there is a cell.detailTextLabel for displaying additional info
        
        if (item.done) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = items[indexPath.row]
        item.done = !item.done
        tableView.reloadData()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! ComposeViewController
        destinationVC.delegate = self
    }
    
    // MARK: compose delegate
    
    func userSavedItem(item: ToDoItem) {
        print("user wants to save an item!")
    }
    
    
    
}
