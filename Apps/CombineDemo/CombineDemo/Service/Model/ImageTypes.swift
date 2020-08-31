//
//  Series.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation

struct ImageTypes: Codable {
    var medium: String?
    var original: String?

    init(medium: String?, original: String?) {
        self.medium = medium
        self.original = original
    }
}
