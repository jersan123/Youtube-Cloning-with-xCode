//
//  SettingCell.swift
//  Youtube
//
//  Created by Jersan Balago on 16/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            iconImageView.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
        
    }
    
    var setting: Setting? {
        didSet {
            
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
            }
            
            nameLabel.text = setting?.name.rawValue
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")?.withRenderingMode(.alwaysOriginal)
        imageView.tintColor = UIColor.darkGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func setupViews() {
        
        addSubview(iconImageView)
        addSubview(nameLabel)
        
        iconImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 30, height: 0)
        nameLabel.anchor(top: topAnchor, left: iconImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
}
