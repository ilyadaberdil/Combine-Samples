//
//  SampleModelForPost.swift
//  CombineDemo
//
//  Created by berdil karaçam on 11.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation

public struct SampleModelForPost: Codable {
    public var name: String?
    public var job: String?
    public var id: String?
    public var createdAt: String?
    
    public init(name: String?, job: String?, id: String?, createdAt: String?) {
        self.name = name
        self.job = job
        self.id = id
        self.createdAt = createdAt
    }
    
}

public struct TokenModel: Codable {
    public var token: String?

    public init() { }
}


import Foundation

public struct SampleParameter: Codable {
    public var email: String?
    public var password: String?
    
    public init(email: String?, password: String?) {
        self.email = email
        self.password = password
    }
}
