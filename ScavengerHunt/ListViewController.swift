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
        if(item.completed) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            cell.imageView.image = item.photo
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
            cell.imageView.image = nil
        }
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        presenting the camera window
//        let imagePicker = UIImagePickerController()
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
//            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
//        } else {
//            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        }
//        imagePicker.delegate = self
//        presentViewController(imagePicker, animated: true, completion: nil)
        
        // present article view
//        let articleView = AddViewController()
        let storyboard: UIStoryboard = self.storyboard!
        let articleView: UIViewController = storyboard.instantiateViewControllerWithIdentifier("articleStoryboard") as UIViewController
        
        presentViewController(articleView, animated: true, completion: nil)
    }
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
//        let indexPath = tableView.indexPathForSelectedRow()!
//        let selectedItem = itemsList.items[indexPath.row]
//        let photo = info[UIImagePickerControllerOriginalImage] as UIImage
//        selectedItem.photo = photo
//        itemsList.save()
//        dismissViewControllerAnimated(true, completion: {
//            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
//            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//        })
//        
//    }
    
//    @IBAction func unwindToList (segue:UIStoryboardSegue) {
//        if segue.identifier == "DoneItem" {
//            let addItemController = segue.sourceViewController as AddViewController
//            if let newItem = addItemController.scavengerItem {
//                itemsList.items += [newItem]
//                itemsList.save()
//                let indexPath = NSIndexPath (forRow: itemsList.items.count-1, inSection: 0)
//                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//            }
//        }
//        
//    }
    
    
}


