//
//  FeaturedViewController.swift
//  VidVideoSwift
//
//  Created by Vitaliy on 10/20/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let kCustomCellIdentifier = "CustomCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayVideosParse : [VideoFile] = []
    

    ///MARK: viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let urlString = "https://api.vid.me/videos/featured"
        
        APIRequest.getVideosArray(urlString) { (videoFile: [VideoFile]?) in
            
            if let videoFile = videoFile {
                self.arrayVideosParse = videoFile
                self.tableView.reloadData()
                print("arrayVideosParse.count = \(videoFile.count)")
            } else {
                print("videoFile is missing")
            }
        }
        
        print(arrayVideosParse.count)
        
        tableView.registerNib(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier:kCustomCellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     internal func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130
    }

    
    //MARK:UITableViewDataSource
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVideosParse.count
    }
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(kCustomCellIdentifier, forIndexPath: indexPath) as! CustomCell
        
        let video = self.arrayVideosParse[indexPath.row]
        
        cell.processVideo(video)
        
        return cell
    }

}
