//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Guilherme B. Carvalho on 11/8/14.
//  Copyright (c) 2014 Guilherme B. Carvalho. All rights reserved.
//

import UIKit

class ScavengerHuntItem: NSObject {
    
    var name:String
    var photo:UIImage?
    var date:String
    var desc:String
    
    var completed: Bool {
        get {
            if photo != nil {
                return true
            }
            return false
        }
    }
    init (name: String) {
        
        self.name = name
        self.date = name
        self.desc = name
        
        
    }
}
