//
//  AddViewController.swift
//  ScavengerHunt
//
//  Created by Guilherme B. Carvalho on 11/7/14.
//  Copyright (c) 2014 Guilherme B. Carvalho. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

//    @IBOutlet weak var textField: UITextField!
//    var articleItem: ArticleItem?
    @IBOutlet weak var titleBar: UINavigationItem!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var content: UIWebView!
    var item:ArticleItem?
    @IBOutlet weak var testImg: UIImageView!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let myitem = item {
            println(myitem.name)
            articleTitle.text = myitem.name
            content.loadHTMLString(myitem.desc, baseURL: nil)
            

            if let url = NSURL(string: myitem.photo!) {
                let session = NSURLSession.sharedSession()
                println("test2")
                let dataTask = session.dataTaskWithURL(url, completionHandler: { (data, response, error) in
                    println("test")
                    var temp = UIImage(data: data)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.testImg.image = temp
                    })
                    
                })
                dataTask.resume()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
//                        self. dismissViewControllerAnimated(true, completion: nil)

    }

}

