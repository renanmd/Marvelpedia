//
//  ViewController.swift
//  Marvelpedia
//
//  Created by Renan Diniz on 24/02/20.
//  Copyright © 2020 RMD Goup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MarvelService.getCharacters { characters in
            print(characters?.last?.name)
        }
    }


}

