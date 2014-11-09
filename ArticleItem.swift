//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Guilherme B. Carvalho on 11/8/14.
//  Copyright (c) 2014 Guilherme B. Carvalho. All rights reserved.
//

import UIKit

class ArticleItem: NSObject {
    let uid: String?
    var name: String? = ""
    var photo:String? = ""
    var date: String? = ""
    var desc: String? = ""

    init (uid: String = " ") {
        self.uid = uid
    }
}
