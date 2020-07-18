//
//  ViewController.swift
//  mySNS
//
//  Created by Sakurako Shimbori on 2020/07/18.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //投稿ボタンを定義
    let postButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        
    }


}

