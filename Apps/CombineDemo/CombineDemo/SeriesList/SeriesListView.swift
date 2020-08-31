//
//  ListView.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit

struct SeriesListView: View {
    @ObservedObject var viewModel: SeriesListViewModel
    
    init(viewModel: SeriesListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        //    NavigationView {
        List {
            searchField
            seriesListSection
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Series 📺")
        .onAppear {
            self.viewModel.onAppear()
        }
        //   }
    }
}

extension SeriesListView {
    var searchField: some View {
        TextField("e.g. How I Met Your Mother", text: $viewModel.searchedSeries)
    }
    
    var seriesListSection: some View {
        Section {
//            ForEach (0..<5) { _ in
//                Text("x")
//            }
            ForEach(viewModel.dataSource, content: SeriesListRowView.init(viewModel:))
        }
    }
}
















//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
