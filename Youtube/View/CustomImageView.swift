//
//  CustomImageView.swift
//  Youtube
//
//  Created by Jersan Balago on 16/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingURLString(urlString: String) {
        
        imageUrlString = urlString
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
            }
            
            }.resume()
    }
}
