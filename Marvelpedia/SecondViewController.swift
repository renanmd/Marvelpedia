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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imageDisplay.image = UIImage(named: character?.thumbnail)
        
        nameLabel.text = character?.name
        descriptionLabel.text = character?.description
        
    }
}
