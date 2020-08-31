//
//  ServiceCore.swift
//  CombineDemo
//
//  Created by berdil karaçam on 7.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation
import Combine

class ServiceCore {
    
    public static func fetch<T, R>(method: HttpMethod<T>) -> AnyPublisher<R, Error> where T: Codable, R: Codable {
        
        func createRequest<T: Codable>(for method: HttpMethod<T>) throws ->  URLRequest? {
            var req: URLRequest?
            let headers = [
                "Content-Type": "application/json",
                "cache-control": "no-cache",
            ]
            
            switch method {
            case .GET(let urlComponents):
                
                guard let url = urlComponents.url else {
                    throw ServiceError.invalidURL
                }
                
                req = URLRequest(url: url,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
                req?.httpMethod = "GET"
                
            case let .POST(urlComponents, param):
                
                let encoder = JSONEncoder()
                
                guard let postData = try? encoder.encode(param) else {
                    throw ServiceError.invalidBody
                }
                
                guard let url = urlComponents.url else {
                    throw ServiceError.invalidEndpoint
                }
                
                req = URLRequest(url: url,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
                req?.httpMethod = "POST"
                req?.allHTTPHeaderFields = headers
                req?.httpBody = postData as Data
            }
            return req
        }
        
        do {
            guard let request = try createRequest(for: method) else {
                return Fail(error: ServiceError.requestException).eraseToAnyPublisher()
            }
            
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { output in
                    guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                        throw ServiceError.networkException
                    }
                    return output.data
            }
            .decode(type: R.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        } catch(let error) {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}



//    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ServiceError> {
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .secondsSince1970
//
//        return Just(data)
//            .decode(type: T.self, decoder: decoder)
//            .mapError { error in
//                .parsing
//        }
//        .eraseToAnyPublisher()
//    }
