//
//  APIRequest.swift
//  VidVideoSwift
//
//  Created by Vitaliy on 10/26/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import Alamofire

class APIRequest: NSObject {
    
    class func getVideosArray (enterURLString:String, clousore:([VideoFile]?)->()) {
        
        Alamofire.request(.GET, enterURLString).responseJSON { (response) -> Void in
            
            if let JSON = response.result.value {
                
                var arrayVideos = [VideoFile]()
                
                let videosArray = JSON["videos"] as! NSArray
                
                print("Videos Array = \(videosArray)")
                
                for video in videosArray {
                    
                    let video = VideoFile(listVideoJSON : video as! NSDictionary)
                    arrayVideos.append(video)
                }
                
                if arrayVideos.count > 0 {
                    
                    clousore(arrayVideos)
                } else {
                    clousore(nil)
                }
            } else {
                
                clousore(nil)
            }

        }
    }
}