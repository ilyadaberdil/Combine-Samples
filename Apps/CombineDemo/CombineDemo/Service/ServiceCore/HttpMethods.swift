//
//  HTTPMethods.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation

enum HttpMethod<T: Codable> {
    case GET(urlComponents: URLComponents)
    case POST(urlComponents: URLComponents, param: T?)
}
