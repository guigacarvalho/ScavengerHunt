//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Guilherme B. Carvalho on 11/8/14.
//  Copyright (c) 2014 Guilherme B. Carvalho. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    var itemsList = [ScavengerHuntItem]()

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = itemsList[indexPath.row].name
        return cell
    }
    // = ["Cat", "Bird", "Brick"]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as UINavigationController
        let viewController = navigationController.viewControllers.first! as UIViewController
        
        if segue.identifier == "AddItem" {
            viewController.title = "New"
        }
        else if segue.identifier == "EditItem" {
            viewController.title = "Edit"
        }
    }
    
    @IBAction func unwindToList (segue:UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addItemController = segue.sourceViewController as ViewController
            if let newItem = addItemController.scavengerItem {
                itemsList += [newItem]
                let indexPath = NSIndexPath (forRow: itemsList.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
    
}

