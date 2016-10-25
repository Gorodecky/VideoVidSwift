//
//  VideoFille.swift
//  VidVideoSwift
//
//  Created by Vitaliy on 10/21/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import Foundation

class VideoFile {

    var videoName : String
    var videoUrl : String?
    var videoThumbnailURL : String
    
    init (listVideoJSON video: NSDictionary) {
        let videosDictioary = video
        //print("videosDictioary  \(videosDictioary)")
        
        videoName = videosDictioary["title"] as! String
        videoUrl = videosDictioary["clip_url"] as? String
        videoThumbnailURL = videosDictioary["thumbnail_url"] as! String
        
        
    }

}