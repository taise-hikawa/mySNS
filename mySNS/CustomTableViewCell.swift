//
//  CustomTableViewCell.swift
//  mySNS
//
//  Created by Sakurako Shimbori on 2020/08/28.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var userImageView: UIImageView!
    var nameLabel: UILabel!
    var screenNameLabel: UILabel!
    var dateLabel: UILabel!
    var bodyLabel: UILabel!
    var imageTask: URLSessionDataTask?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(userImageView)
//        addSubview(nameLabel)
//        addSubview(screenNameLabel)
//        addSubview(dateLabel)
        addSubview(bodyLabel)
        
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        userImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        userImageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
//        userImageView.widthAnchor.constraint(equalTo: self.widthAnchor)
        userImageView.image = UIImage(named: "man")
        userImageView.contentMode = .scaleAspectFit
        
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor).isActive = true
        bodyLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bodyLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
