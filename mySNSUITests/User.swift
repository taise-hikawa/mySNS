//
//  User.swift
//  mySNS
//
//  Created by Sakurako Shimbori on 2020/08/27.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import RealmSwift
import Foundation

class User: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var screen_name = ""
    @objc dynamic var profile_image_url_https = ""
    //idをプライマリーキーに設定
    override class func primaryKey() -> String? {
        return "id"
    }
}
