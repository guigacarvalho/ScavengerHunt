//
//  itemsManager.swift
//  ScavengerHunt
//
//  Created by Guilherme B. Carvalho on 11/8/14.
//  Copyright (c) 2014 Guilherme B. Carvalho. All rights reserved.
//

import Foundation
import UIKit

class ItemsManager {
    var items = [ArticleItem]()
    
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        let documentsDirectoryURL = documentsDirectoryURLs.first!
        let archiveURL = documentsDirectoryURL.URLByAppendingPathComponent("ScavengerHuntItems", isDirectory: false)
        return archiveURL.path!
        }()
    
    
    func parseJSON (jsonString: String) -> [[String: AnyObject]]? {
        if let  data = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
            var error:NSError?

            if let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error) as? [[String: AnyObject]] {
                return json
            } else if let error = error {
                println("JSON Error \(error)")
            } else {
                println("Unk error")
            }
        }
        return nil
    }
    
    init() {
        
        var urlString = "http://clinicas.engr.scu.edu/index.php/clinicas_api/articles/count/1"
        var error:NSError?
        
        var url = NSURL(string: urlString)
        
        var result = String(contentsOfURL: url! , encoding: NSUTF8StringEncoding, error: &error)
        if let array = parseJSON(result!) {
            println("Array \(array.count)")
            for article in array {
                
                println(article["title"])
                let item = ArticleItem(uid: article["articleId"] as String)
                item.name = article["title"] as? String
                item.desc = article["content"] as? String
                item.date = article["date"] as? String

                item.photo = article["pictureUrl"] as? String
//                let url2 = NSURL(string: imgURL!)!
//                let imageData = NSData(contentsOfURL: url2)!
//                item.photo = UIImage(data: imageData)
                
                items.append(item)
            }

        
        }
        
    }
    
}