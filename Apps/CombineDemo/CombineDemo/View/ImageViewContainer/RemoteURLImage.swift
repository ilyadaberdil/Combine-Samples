//
//  RemoteImageUrl.swift
//  CombineDemo
//
//  Created by berdil karaçam on 8.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation
import Combine

class RemoteImageURL: ObservableObject {

    @Published var data = Data()
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }

//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else { return }
//            DispatchQueue.main.async { self.data = data }
//            }.resume()
        
        _ = URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                default:
                    break
                }
            }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.data = data
            })
    }
}
