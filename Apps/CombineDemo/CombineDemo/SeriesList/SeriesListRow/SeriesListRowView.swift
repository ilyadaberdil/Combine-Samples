//
//  SeriesListRowView.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import SwiftUI
import Combine

struct SeriesListRowView: View {
    
    private let viewModel: SeriesListRowViewModel
    
    init(viewModel: SeriesListRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationLink(destination: viewModel.seriesDetailView) {
            HStack(spacing: 16) {
                RemoteURLImageView(imageUrl: viewModel.image ?? "-", renderingType: .thumbnail)
                VStack(alignment: .leading, spacing: 2) {
                    nameText
                    ratingText
                }
            }
        }
    }
}

extension SeriesListRowView {
    
    var nameText: some View {
        return Text(viewModel.name ?? "-")
            .bold()
            .fontWeight(.regular)
            .lineLimit(2)
            .font(.headline)
    }
    
    var ratingText: some View {
        return Text("Rating Score: \(String(format: "%0.1f", viewModel.score ?? "-")) ")
            .fontWeight(.light)
            .font(.caption)
    }
    
}





//struct SeriesListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SeriesListRowView()
//    }
//}
