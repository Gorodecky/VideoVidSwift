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
    
    func getVideosArray (enterURLString : String, clousore:([VideoFile]	-> ())) {
    
    
        var arrayVideos = [VideoFile]()
        
        Alamofire.request(.GET, enterURLString).responseJSON { (request, response, rezult) -> Void in
            
            //print("RQUEST: \(request)")
            //print("RESPONSE: \(response)")
            //print("REZULT: \(rezult.value)")
            
            if let JSON = rezult.value {
                
                //print(JSON)
                
                let videosArray = JSON["videos"] as! NSArray
                
                //print(videosArray)
                
                
                
                for video in videosArray {
                    
                    let video = VideoFile(listVideoJSON : video as! NSDictionary)
                    arrayVideos.append(video)
                    
                    /*
                    print("video = ")
                    print("videoName = \(video.videoName)")
                    print("videoUrl = \(video.videoUrl)")
                    print("videoThumbnailURL = \(video.videoThumbnailURL)")
                    print("/////////////////////////")*/
                }
                //print(arrayVideos.count)
            }
        }
        clousore(arrayVideos)
    }
}
