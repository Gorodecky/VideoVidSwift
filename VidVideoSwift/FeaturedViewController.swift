//
//  FeaturedViewController.swift
//  VidVideoSwift
//
//  Created by Vitaliy on 10/20/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import Alamofire


class FeaturedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://api.vid.me/videos/featured"
        
       
            
        Alamofire.request(.GET, urlString).responseJSON { (request, response, rezult) -> Void in
            
            //print("RQUEST: \(request)")
            //print("RESPONSE: \(response)")
            //print("REZULT: \(rezult.value)")
            
            if let JSON = rezult.value {
                
                print(JSON)
                
                let videosArray = JSON["videos"] as! NSArray
                
                //print(videosArray)
                
                var arrayVideosParse = [VideoFile]()
                
                for video in videosArray {
                
                   let video = VideoFile(listVideoJSON : video as! NSDictionary)
                    arrayVideosParse.append(video)
                    
                    print("video = ")
                    print("videoName = \(video.videoName)")
                    print("videoUrl = \(video.videoUrl)")
                    print("videoThumbnailURL = \(video.videoThumbnailURL)")
                    print("/////////////////////////")

                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
