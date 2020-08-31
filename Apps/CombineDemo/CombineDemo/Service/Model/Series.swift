//
//  Series.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation

struct Series: Codable {
    var score: Double?
    var show: Show?
    
    init(score: Double?, show: Show?) {
        self.score = score
        self.show = show
    }
}
