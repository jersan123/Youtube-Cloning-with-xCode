//
//  BaseCell.swift
//  Youtube
//
//  Created by Jersan Balago on 15/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
}
