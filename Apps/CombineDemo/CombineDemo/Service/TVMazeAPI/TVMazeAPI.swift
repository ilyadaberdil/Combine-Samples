//
//  TVMazeAPI.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation

// http://api.tvmaze.com/search/shows?q=marvel
class TVMazeAPI {
    
    struct TVMazeAPIComponents {
      static let scheme = "http"
      static let host = "api.tvmaze.com"
      static let path = "/search"
     // static let key = "6504b090cb32ad2202068432a77500ba"
    }
   
    static func createSeriesListComponents(withSeries series: String) -> URLComponents {
      var components = URLComponents()
      components.scheme = TVMazeAPIComponents.scheme
      components.host = TVMazeAPIComponents.host
      components.path = TVMazeAPIComponents.path + "/shows"

      components.queryItems = [
        URLQueryItem(name: "q", value: series),
        URLQueryItem(name: "mode", value: "json"),
        URLQueryItem(name: "units", value: "metric"),
     //   URLQueryItem(name: "APPID", value: TVMazeAPIComponents.key)
      ]
      return components
    }
}
