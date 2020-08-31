//
//  SeriesResource.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation
import Combine

protocol SeriesResource {
    func fetchMovies(series: String) -> AnyPublisher<[Series], Error>
    func samplePost(param: SampleParameter) -> AnyPublisher<TokenModel,Error>
}

class SeriesResourceImpl: SeriesResource {
    func samplePost(param: SampleParameter) -> AnyPublisher<TokenModel, Error> {
        let urlComponents = URLComponents(url: URL(string: "https://reqres.in/api/login")!, resolvingAgainstBaseURL: true)
        return ServiceCore.fetch(method: .POST(urlComponents: urlComponents!, param: param))
    }
    
    func fetchMovies(series: String) -> AnyPublisher<[Series], Error> {
        return ServiceCore.fetch(method: HttpMethod<ServiceVoid>.GET(urlComponents: TVMazeAPI.createSeriesListComponents(withSeries: series)))
    }
}

public struct ServiceVoid: Codable {

    init() { }
}
