//
//  Thumbnail.swift
//  Marvelpedia
//
//  Created by Renan Diniz on 25/02/20.
//  Copyright © 2020 RMD Goup. All rights reserved.
//

import Foundation

class Thumbnail: Decodable {
    let path: String?
    let imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}
