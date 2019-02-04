//
//  VideoCell.swift
//  Youtube
//
//  Created by Jersan Balago on 15/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            
            if let videoTitle = video?.title {
                
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: videoTitle).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 44
                }
                else {
                    titleLabelHeightConstraint?.constant = 20
                }
                
                subtitleTextView.anchor(top: titleLabel.bottomAnchor, left: userProfileImageView.rightAnchor, bottom: nil, right: thumbnailImageView.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
                
                titleLabel.text = videoTitle
            }
            
            setupThumbnailImage()
            
            setupProfileImage()
            
            var subtitle: String = ""
            
            if let profileName = video?.channel?.name {
                subtitle += "\(profileName) "
            }
            
            if let numberOfViews = video?.numberOfViews {
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                if let value = numberFormatter.string(from: numberOfViews as NSNumber) {
                    subtitle += " • \(value) views • 2 years ago"
                }
            }
            
            subtitleTextView.text = subtitle
            
        }
        
    }
    
    func setupProfileImage() {
        if let profileImageUrl = video?.channel?.profileImageName {
            userProfileImageView.loadImageUsingURLString(urlString: profileImageUrl)
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageUrl = video?.thumbnailImageName {
            thumbnailImageView.loadImageUsingURLString(urlString: thumbnailImageUrl)
        }
    }
    
    let thumbnailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return imageView
    }()
    
    let userProfileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Title Here"
        label.numberOfLines = 0
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = UIColor.darkGray
        textView.isEditable = false
        return textView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return view
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        
        addSubview(thumbnailImageView)
        addSubview(userProfileImageView)
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        thumbnailImageView.anchor(top: topAnchor, left: leftAnchor, bottom: userProfileImageView.topAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 8, paddingRight: 16, width: 0, height: 0)
        
        userProfileImageView.anchor(top: nil, left: thumbnailImageView.leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 28, paddingLeft: 0, paddingBottom: 40, paddingRight: 0, width: 44, height: 44)
        
        titleLabel.anchor(top: thumbnailImageView.bottomAnchor, left: userProfileImageView.rightAnchor, bottom: nil, right: thumbnailImageView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(titleLabelHeightConstraint!)
        
        subtitleTextView.anchor(top: titleLabel.bottomAnchor, left: userProfileImageView.rightAnchor, bottom: nil, right: titleLabel.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        separatorView.anchor(top: bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    }
    
}
