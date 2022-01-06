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

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var character: Character?
    let placeHolderImage = UIImage(named: "Marvel-PlaceHolder")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imageDisplay.image = UIImage(named: character?.thumbnail)
        
        nameLabel.text = character?.name
        descriptionLabel.text = character?.description
        
        if let character = self.character {
            let fullPath = (character.thumbnail?.path ?? "") + "/portrait_xlarge." + (character.thumbnail?.imageExtension ?? "")

            if let imageUrl = URL(string: fullPath) {
                imageDisplay.sd_setImage(with: imageUrl, placeholderImage: self.placeHolderImage)
            } else {
                imageDisplay.image = nil
            }
        }
    }
}


//if let character = self.character {
//    let fullPath = (character.thumbnail?.path ?? "") + "/portrait_xlarge." + (character.thumbnail?.imageExtension ?? "")
//
//    if let imageUrl = URL(string: fullPath) {
//        imageDisplay.sd_setImage(with: imageUrl, placeholderImage: self.placeHolderImage)
//    } else {
//        imageDisplay.image = nil
//    }
//}
