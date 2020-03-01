//
//  SecondViewController.swift
//  Marvelpedia
//
//  Created by Renan Diniz on 01/03/20.
//  Copyright © 2020 RMD Goup. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

//var imageDataURL = ""

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageDisplay: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imageDisplay.image = UIImage(named: myImageData)
        //imageDisplay.image = UIImage(named: "Marvel-PlaceHolder")
        //cell.imageView?.sd_setImage(with: imageUrl, placeholderImage: self.placeHolderImage)
        imageDisplay.image = UIImage.sd_image(with: myImageData)
        
    }
}
