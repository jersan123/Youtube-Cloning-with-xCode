//
//  VideoLauncher.swift
//  Youtube
//
//  Created by Jersan Balago on 23/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

class VideoLauncher: NSObject {
    
    
    func showVideoPlayer() {
        
        if let keyWindow = UIApplication.shared.keyWindow {
            
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.white
            
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            let height = keyWindow.frame.width * 9 / 16
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            view.addSubview(videoPlayerView)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = keyWindow.frame
            }) { (completedAnimation) in
                UIApplication.shared.isStatusBarHidden = true
                
            }
            
            keyWindow.addSubview(view)
        }
        
        
    }
    
}
