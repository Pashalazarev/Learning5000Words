//
//  NetworkService.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 19.04.2023.
//

import Foundation

final class NetworkService {
    enum networkError: Error {
        case invalidUrl
        case noData
        case decodingError
    }
    
     static let shared = NetworkService()
    
    private init() {}
    
}
