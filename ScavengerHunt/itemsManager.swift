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
    
    
    init() {
    
    var urlString = "http://clinicas.engr.scu.edu/index.php/clinicas_api/articles"
    var error:NSError?
    
    var url = NSURL(string: urlString)
    
    var result = String(contentsOfURL: url! , encoding: NSUTF8StringEncoding, error: &error)
    println(result)
    }
    
}