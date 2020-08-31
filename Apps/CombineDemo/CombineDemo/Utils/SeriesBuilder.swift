//
//  SeriesBuilder.swift
//  CombineDemo
//
//  Created by berdil karaçam on 8.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation
import SwiftUI

enum SeriesBuilder {
    static func createSeriesDetailView(withSeries series: Series?) -> some View {
        let viewModel = SeriesDetailViewModel(series: series)
        return SeriesDetailView(viewModel: viewModel)
    }
    
    static func createSeriesListView() -> some View {
        let viewModel = SeriesListViewModel()
        return SeriesListView(viewModel: viewModel)
    }
}
