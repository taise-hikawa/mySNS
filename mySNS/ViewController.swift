//
//  ViewController.swift
//  mySNS
//
//  Created by Sakurako Shimbori on 2020/07/18.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import Foundation
import RealmSwift
import Security
import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //投稿ボタンを定義
    let postButton = UIButton()
    //テーブルビューインスタンス作成
    var tableView: UITableView!
    //投稿のリスト(タプル配列)
    //    var postList : [(content:String , image:UIImage?)] = []
    let posts = ["aaaaaa","bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView = UITableView(frame: self.view.frame, style: UITableView.Style.grouped)
        //Table ViewのdataSourceを設定
        tableView.dataSource = self
        //Table Viewのdelegate設定
        tableView.delegate = self
        //TableViewを表示
        self.view.addSubview(tableView)
        
        //投稿ボタンの設定
        //ボタンの背景を青
        postButton.backgroundColor = UIColor.blue
        //ボタンを表示
        self.view.addSubview(postButton)
        //ボタンの配置
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15).isActive = true
        postButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -15).isActive = true
        postButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //ボタンを丸く
        postButton.layer.cornerRadius = 30.0
        //ボタンに画像をセット
        postButton.setImage(UIImage(named: "post_image"), for: .normal)
        postButton.contentMode = .scaleAspectFit
        postButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        postButton.addTarget(self, action: #selector(ViewController.btntapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        
    }
    //tableViewの行数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = setRealm()
        return realm.objects(Post.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//            ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let realm = setRealm()
        print(realm.objects(Post.self).last!.text)
//        cell.textLabel?.text = realm.objects(Post.self)[indexPath.row].text
        cell.bodyLabel.text = realm.objects(Post.self)[indexPath.row].text
        return cell
    }
    @objc func btntapped(_ sender : Any) {
        self.performSegue(withIdentifier: "post", sender: self)
    }
    
    func setRealm() -> Realm{
        var config = Realm.Configuration()
        config.migrationBlock = {(migration,oldSchemaVersion) in
            if oldSchemaVersion < 1{
                var nextID = 0
                migration.enumerateObjects(ofType:Post.className(), {(oldObject,newObject) in
                    newObject!["id"] = nextID
                    nextID += 1
                })
            }
        }
        config.schemaVersion = 1
        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
        return realm
        
    }
    
    
    
    
    
}

