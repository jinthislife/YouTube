//
//  SubscriptionCell.swift
//  YouTube
//
//  Created by reyaong on 6/3/17.
//  Copyright © 2017 reyaong. All rights reserved.
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
