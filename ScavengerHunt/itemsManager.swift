//
//  itemsManager.swift
//  ScavengerHunt
//
//  Created by Guilherme B. Carvalho on 11/8/14.
//  Copyright (c) 2014 Guilherme B. Carvalho. All rights reserved.
//

import Foundation
class ItemsManager {
    var items = [ScavengerHuntItem]()
    
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        let documentsDirectoryURL = documentsDirectoryURLs.first!
        let archiveURL = documentsDirectoryURL.URLByAppendingPathComponent("ScavengerHuntItems", isDirectory: false)
        return archiveURL.path!
        }()
    
    
    func parseJSON (jsonString: String) -> [String: AnyObject]? {
        if let  data = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
            var error:NSError?
            if let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error) as? [String: AnyObject]{
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
        
        var urlString = "http://clinicas.engr.scu.edu/index.php/ios_api/articles"
        var error:NSError?
        
        var url = NSURL(string: urlString)
        
        var result = String(contentsOfURL: url! , encoding: NSUTF8StringEncoding, error: &error)
            println(result)
//        let  data = result?.dataUsingEncoding(NSUTF8StringEncoding)
//        let json = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(0), error: &error) as? [String: AnyObject]
        if let dictionary = parseJSON(result!) {
            println("Dictionary \(dictionary)")
        }
        
    }
    
}