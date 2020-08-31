//
//  Errors.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation

enum ServiceError: LocalizedError {
    case networkException
    case invalidURL
    case invalidBody
    case invalidEndpoint
    case requestException
 //   case parsing
}
