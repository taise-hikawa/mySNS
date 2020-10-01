//
//  Post.swift
//  mySNS
//
//  Created by Sakurako Shimbori on 2020/07/20.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import RealmSwift
import Foundation

class Post: Object {
    @objc dynamic var id = 0
    @objc dynamic var created_at = ""
    @objc dynamic var text = ""
    @objc dynamic var user: User?
    
    //idをプライマリーキーに設定
    override class func primaryKey() -> String? {
        return "id"
    }
}
