//
//  FeaturedViewController.swift
//  VidVideoSwift
//
//  Created by Vitaliy on 10/20/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit


class FeaturedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://api.vid.me/videos/featured"
        
        let apiManager = ApiManager()
            
        apiManager.createJSON(urlString)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
