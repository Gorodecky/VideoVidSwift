//
//  FeaturedViewController.swift
//  VidVideoSwift
//
//  Created by Vitaliy on 10/20/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import Alamofire


class FeaturedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let kCustomCellIdentifier = "CustomCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayVideosParse : [VideoFile] = []
    

    ///MARK: viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let urlString = "https://api.vid.me/videos/featured"
        
        let api = APIRequest()
        
        api.getVideosArray(urlString) { (videos:[VideoFile]) -> () in
            
            self.arrayVideosParse = videos
            self.tableView.reloadData()
            print(self.arrayVideosParse.count)
        }
        
        
        //print(arrayVideosParse.count)
        
        tableView.registerClass(CustomCell.self, forCellReuseIdentifier: kCustomCellIdentifier)
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: kCustomCellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:UITableViewDataSource
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVideosParse.count
    }
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCustomCellIdentifier) as! CustomCell
        
        
        
        return cell
    }

}
