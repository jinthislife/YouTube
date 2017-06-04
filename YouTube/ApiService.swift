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
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideo(completion: @escaping ([Video]) -> ()) {
//        fetchFeedForURLString(urlString: "\(baseUrl)/home.json") { (videos) in
//            completion(videos)
//        }
//        fetchFeedForURLString(urlString: "\(baseUrl)/home.json", completion: completion)
        fetchFeedForURLString(urlString: "\(baseUrl)/home_num_likes.json", completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForURLString(urlString: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriptionFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForURLString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }
    
    func fetchFeedForURLString(urlString: String, completion: @escaping ([Video]) -> ()) {
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                    
                    DispatchQueue.main.async(execute: {
                        completion(jsonDictionaries.map({return Video(dictionary: $0)}))
                    })
                }
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
}

//URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//    
//    if error != nil {
//        print(error!)
//        return
//    }
//    do {
//        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//        
//        var videos = [Video]()
//        for dictionary in json as! [[String: AnyObject]] {
//            let video = Video()
//            video.title = dictionary["title"] as? String
//            video.thumbNailImageName = dictionary["thumbnail_image_name"] as? String
//            
//            let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//            let channel = Channel()
//            channel.name = channelDictionary["name"] as? String
//            channel.profileImageName = channelDictionary["profile_image_name"] as! String?
//            video.channel = channel
//            
//            videos.append(video)
//        }
//        
//        DispatchQueue.main.async(execute: {
//            completion(videos)
//        })
//        
//    } catch let jsonError {
//        print(jsonError)
//    }
//    
//}).resume()
//
//}




