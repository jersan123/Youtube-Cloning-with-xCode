//
//  Video.swift
//  Youtube
//
//  Created by Jersan Balago on 15/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

struct Video: Decodable {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: Int?
    var uploadDate: Date?
    var duration: Int?
    var numberOfLikes: Int?
    
    var channel: Channel?
}


struct Channel: Decodable {
    
    var name: String?
    var profileImageName: String?
    
}

