//
//  SubscriptionCell.swift
//  Youtube
//
//  Created by Jersan Balago on 21/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
