//
//  ApiService.swift
//  YouTube
//
//  Created by reyaong on 6/1/17.
//  Copyright © 2017 reyaong. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    static let sharedInstance = ApiService()
    
    func fetchVideo(completion: @escaping ([Video]) -> ()) {
        
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var videos = [Video]()
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbNailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as! String?
                    video.channel = channel
                    
                    videos.append(video)
                }
                
                DispatchQueue.main.async(execute: {
                    completion(videos)
                })
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }).resume()
        
    }
}
