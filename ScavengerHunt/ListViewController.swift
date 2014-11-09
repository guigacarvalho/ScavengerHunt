//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Guilherme B. Carvalho on 11/8/14.
//  Copyright (c) 2014 Guilherme B. Carvalho. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    var itemsList = ItemsManager()

    
    override func viewDidLoad() {
    (self.parentViewController as UINavigationController).hidesBarsOnSwipe = true
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.items.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        let item = itemsList.items[indexPath.row]
        cell.textLabel.text = item.name
//            cell.imageView.image = item.photo
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var tempItem = itemsList.items[indexPath.row]
        performSegueWithIdentifier("article", sender: tempItem)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="article") {
            var articleViewCtrl = segue.destinationViewController as ArticleViewController
            articleViewCtrl.item = sender as? ArticleItem
        }
    }
    
   
    
}


