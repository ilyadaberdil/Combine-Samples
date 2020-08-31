//
//  Series.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation

//enum ImageTypes: String, Codable {
//    case medium
//    case original
//}

struct Show: Codable {
    var name: String?
    var summary: String?
    var image: ImageTypes?

    init(name: String?, summary: String?, image: ImageTypes?) {
        self.name = name
        self.summary = summary
        self.image = image
    }
    
}
