//
//  TrendingCell.swift
//  Youtube
//
//  Created by Jersan Balago on 21/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }

}
