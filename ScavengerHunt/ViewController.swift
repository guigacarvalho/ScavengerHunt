//
//  ViewController.swift
//  ScavengerHunt
//
//  Created by Guilherme B. Carvalho on 11/7/14.
//  Copyright (c) 2014 Guilherme B. Carvalho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var scavengerItem: ScavengerHuntItem?
    @IBOutlet weak var titleBar: UINavigationItem!

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = textField.text {
                if !name.isEmpty {
                    scavengerItem = ScavengerHuntItem(name: name)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

