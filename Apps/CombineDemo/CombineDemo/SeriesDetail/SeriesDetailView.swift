//
//  SeriesDetailView.swift
//  CombineDemo
//
//  Created by berdil karaçam on 8.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import SwiftUI

struct SeriesDetailView: View {

    var viewModel: SeriesDetailViewModel
    
    var body: some View {
        VStack {
            RemoteURLImageView(imageUrl: viewModel.series?.show?.image?.original ?? "*", renderingType: .large)
            nameText
            Spacer()
        }
    }
    
    init(viewModel: SeriesDetailViewModel) {
        self.viewModel = viewModel
    }
}

extension SeriesDetailView {
    var nameText: some View {
        Text(viewModel.series?.show?.name ?? "-")
    }
    
}

//struct SeriesDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SeriesDetailView()
//    }
//}
