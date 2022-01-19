//
//  Endpoint+News.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Combine
import Foundation

extension Endpoint {
    struct Stripe: EndpointProtocol {
        var path: String
        var queryItems: [URLQueryItem] = []
        
        var url: URL {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "<YOUR ENDPOINT BASE URL>"
            components.path = path
            components.queryItems = queryItems
            
            guard let url = components.url else {
                preconditionFailure("Invalid URL components: \(components)")
            }
            
            return url
        }
        
        var headers: [String: Any] {
            return [:]
        }
    }
}

extension Endpoint.Stripe {
    static func paymentIntent() -> Self {
        return Endpoint.Stripe(path: "/checkout", queryItems: [])
    }
}
