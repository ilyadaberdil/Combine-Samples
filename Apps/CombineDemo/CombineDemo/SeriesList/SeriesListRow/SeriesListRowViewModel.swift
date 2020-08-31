//
//  SeriesListRowViewModel.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation
import SwiftUI

class SeriesListRowViewModel: Identifiable {

    var name : String?
    var score: Double?
    var image: String?
    var series: Series?
    
    init(series: Series) {
        self.series = series
        self.name = series.show?.name
        self.score = series.score
        self.image = series.show?.image?.medium
        print("image = \(self.image ?? "nil")")
    }
}


extension SeriesListRowViewModel {
  var seriesDetailView: some View {
    return SeriesBuilder.createSeriesDetailView(withSeries: series)
  }
}


//extension SeriesListRowViewModel: Hashable {
//  static func == (lhs: SeriesListRowViewModel, rhs: SeriesListRowViewModel) -> Bool {
//    return lhs.name == rhs.name
//  }
//
//  func hash(into hasher: inout Hasher) {
//    hasher.combine(self.name)
//  }
//}
