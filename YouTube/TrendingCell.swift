//
//  TrendingCell.swift
//  YouTube
//
//  Created by reyaong on 6/3/17.
//  Copyright © 2017 reyaong. All rights reserved.
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
