//
//  CustomCell.swift
//  VidVideoSwift
//
//  Created by Vitaliy on 10/25/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire


class CustomCell: UITableViewCell {
    
    @IBOutlet weak var imageVideo: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var dateOfCreatedLable: UILabel!
    
    func processVideo(videoFile: VideoFile) {
        
        self.nameLable.text = videoFile.videoName
        self.dateOfCreatedLable.text = videoFile.videoDateOfCreated
        
        getNetworkImage(videoFile.videoThumbnailURL) { (image) -> Void in
            
            self.imageVideo.image = image
            print(self.imageVideo.image?.size)
        }
        
    }
    
    
    func getNetworkImage(urlString: String, completion: (UIImage? -> Void)) -> (Request) {
        
        return Alamofire.request(.GET, urlString).responseImage { (response) -> Void in
            
            guard let image = response.result.value else { return }
            completion(image)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
