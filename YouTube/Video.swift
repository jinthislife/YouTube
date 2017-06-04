//
//  Video.swift
//  YouTube
//
//  Created by reyaong on 5/23/17.
//  Copyright © 2017 reyaong. All rights reserved.
//

import UIKit

class SafeJsonObject: NSObject {
    override func setValue(_ value: Any?, forKey key: String) {
        
        let uppercasedFirstCharacter = String(describing: key.characters.first!).uppercased()
        let range = NSMakeRange(0, 1)
        let selectorString = NSString(string: key).replacingCharacters(in: range, with: uppercasedFirstCharacter)
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        if !responds {
            return
        }
        
        super.setValue(value, forKey: key)
    }
}

class Video: SafeJsonObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?
    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if key == "channel" {
            self.channel = Channel()
            self.channel?.setValuesForKeys(value as! [String: AnyObject])
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    init(dictionary: [String: Any]) {
        super.init()
        setValuesForKeys(dictionary)
    }
}

class Channel: SafeJsonObject {
    
    var name: String?
    var profile_image_name: String?
}




