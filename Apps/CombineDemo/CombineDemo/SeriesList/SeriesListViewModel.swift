//
//  SeriesListViewModel.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation
import Combine

class SeriesListViewModel: ObservableObject {
    
    @Published var searchedSeries: String = ""
    @Published var dataSource: [SeriesListRowViewModel] = []
    
    private var seriesResource: SeriesResource = SeriesResourceImpl()
    
    lazy private var disposables = Set<AnyCancellable>()
    
    init() {
        let _ = $searchedSeries
            .dropFirst()
            .removeDuplicates() /// Publishes only elements that don’t match the previous element.
            .debounce(for: 0.5, scheduler: DispatchQueue(label: "SeriesListViewModel"))
            .sink(receiveValue: fetchSeries(forSeries:))
    }
    
    func onAppear() {
     //   samplePost()
    }
    
    func fetchSeries(forSeries series: String) {
        seriesResource.fetchMovies(series: series)
            .compactMap({$0.compactMap({ SeriesListRowViewModel.init(series: $0) })})
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] response in
                    guard let self = self else { return }
                    switch response {
                    case .failure:
                        self.dataSource = []
                    case .finished:
                        // ommit..
                        break
                    }
                },
                receiveValue: { [weak self] seriesList in
                    guard let self = self else { return }
                    self.dataSource = seriesList
            })
            .store(in: &disposables)
    }
    
    

}
