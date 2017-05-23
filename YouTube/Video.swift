//
//  Video.swift
//  YouTube
//
//  Created by reyaong on 5/23/17.
//  Copyright © 2017 reyaong. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbNailImageName: String?
    var title: String?
    var numberOfView: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

class Channel: NSObject {
    
    var name: String?
    var profileImageName: String?
}
