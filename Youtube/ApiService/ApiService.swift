//
//  ApiService.swift
//  Youtube
//
//  Created by Jersan Balago on 20/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let baseUrl: String = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/home.json", completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriptionFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }
    
    func fetchFeed(forUrlString urlString: String ,completion: @escaping ([Video]) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error ) in
            
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    completion(try decoder.decode([Video].self, from: data))
                } catch let jsonError {
                    print("Failed to decode: ", jsonError)
                }
            }
            
        }.resume()
    }
    
}
