//
//  Networker.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Combine
import Foundation

protocol NetworkServiceProtocol: AnyObject {
    typealias Headers = [String: Any]
    
    func get<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T: Decodable
    func put<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T: Decodable
}

final class NetworkService: NetworkServiceProtocol {
    
    func get<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T : Decodable {
        var urlRequest = URLRequest(url: url)
        let jsonDecoder = JSONDecoder()
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    func put<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T : Decodable {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let jsonDecoder = JSONDecoder()
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}
