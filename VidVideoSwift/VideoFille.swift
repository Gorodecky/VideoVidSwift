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
    var videoUrl : String
    var videoThumbnailURL : String
    
    init (listVideoJSON: NSDictionary) {
        videoName = listVideoJSON["title"] as! String
        videoUrl = listVideoJSON["clip_url"] as! String
        videoThumbnailURL = listVideoJSON["thumbnail_url"] as! String
    }

}