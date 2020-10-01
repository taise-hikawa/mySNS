//
//  postController.swift
//  mySNS
//
//  Created by Sakurako Shimbori on 2020/07/19.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import UIKit
import RealmSwift

class postController: UIViewController {
    let postText = UITextField()
    var rightBarButtonItem = UIBarButtonItem()
    var button = UIButton(type: .custom)
//    // Postというモデルをインスタンス化します。
//    let realmData = Post()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        self.view.addSubview(postText)
        postText.translatesAutoresizingMaskIntoConstraints = false
        postText.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        postText.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        postText.backgroundColor = UIColor.red
        postText.placeholder = "いまどうしてる？"
        postText.sizeToFit()
        
        button = UIButton(frame: CGRect(x: 0, y: 0,
                                        width: 100, height: 30))
        rightBarButtonItem = UIBarButtonItem(customView: button)
        button.backgroundColor = UIColor.init(hex: 0xcce5ff)
        let buttonLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        buttonLabel.text = "投稿する"
        buttonLabel.textColor = UIColor.white
        buttonLabel.textAlignment = NSTextAlignment.center
        button.addSubview(buttonLabel)
        button.layer.cornerRadius = 15.0
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
        // ナビゲーションバーの右に設置する.
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        rightBarButtonItem.isEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(changeNotifyTextField(sender:)), name: UITextField.textDidChangeNotification, object: nil)
        
    }
    @objc func buttonTapped(_ sender : Any) {
        self.navigationController?.popViewController(animated: true)
        let realm = setRealm()
        //投稿内容を設定
        let post = Post()
        post.text = "a"
        post.created_at = "2020/08/26"
        post.id = 23
        post.user = realm.objects(User.self).last
        try! realm.write {
            realm.add(post)
        }
        print(realm.objects(Post.self).last!.text)
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
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
    
    @objc public func changeNotifyTextField (sender: NSNotification) {
        guard let textView = sender.object as? UITextField else {
            return
        }
        if textView.text!.isEmpty {
            
            rightBarButtonItem.isEnabled = false
            button.backgroundColor = UIColor.init(hex: 0xcce5ff)
        }else{
            rightBarButtonItem.isEnabled = true
            button.backgroundColor = UIColor.blue
        }
        
    }


    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
extension UIColor {
    /// 16進カラーコードでカラーを生成
    ///
    /// - Parameters:
    ///   - hex: 16進カラーコード
    ///   - alpha: アルファ値
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        let red: CGFloat = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
