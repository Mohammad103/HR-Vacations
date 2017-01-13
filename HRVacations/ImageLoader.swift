//
//  ImageLoader.swift
//  Taraf
//
//  Created by Mohammad Shaker on 11/8/15.
//  Copyright © 2015 Mohammad Shaker. All rights reserved.
//

import UIKit
import Foundation

class ImageLoader {
    
    // var cache = NSCache()
    
    class var sharedLoader : ImageLoader {
        struct Static {
            static let instance : ImageLoader = ImageLoader()
        }
        return Static.instance
    }
    
    func imageForUrl(urlString: String, index: Int, completionHandler:(_ image: UIImage?, _ index: Int) -> ()) {
        /*dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {()in
            let data: NSData? = self.cache.objectForKey(urlString) as? NSData
            
            if let goodData = data {
                let image = UIImage(data: goodData)
                dispatch_async(dispatch_get_main_queue(), {() in
                    completionHandler(image: image, index: index)
                })
                return
            }
            
            let downloadTask: NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!, completionHandler: {(data, response, error) -> Void in
                if (error != nil) {
                    completionHandler(image: nil, index: index)
                    return
                }
                
                if data != nil {
                    let image = UIImage(data: data!)
                    self.cache.setObject(data!, forKey: urlString)
                    dispatch_async(dispatch_get_main_queue(), {() in
                        completionHandler(image: image, index: index)
                    })
                    return
                }
                
            })
            downloadTask.resume()
        })*/
        
    }
}
