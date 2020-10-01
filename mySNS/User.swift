//
//  User.swift
//  mySNS
//
//  Created by Sakurako Shimbori on 2020/07/28.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import RealmSwift

class User: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var login_id = ""
    dynamic var image = ""
    
//    override class func primaryKey() -> String? {
//        return "id"
//    }
    

}
