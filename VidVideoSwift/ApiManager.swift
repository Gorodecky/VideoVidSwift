//
//  ApiManager.swift
//  VidVideoSwift
//fac
//  Created by Vitaliy on 10/20/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import Foundation

import Alamofire

class ApiManager {
    
    var videos = [:]
    
    func createJSON(urlString: String) {
        
        Alamofire.request(.GET, urlString).responseJSON { (request, response, rezult) -> Void in
            
            print("RQUEST: \(request)")
            print("RESPONSE: \(response)")
            print("REZULT: \(rezult.value)")
            
        }
        print(videos)
    }
}
