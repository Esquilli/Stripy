//
//  Endpoint.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Foundation

protocol EndpointProtocol {
    var path: String { get set };
    var queryItems: [URLQueryItem] { get set };
}

struct Endpoint: EndpointProtocol {
    var path: String
    var queryItems: [URLQueryItem] = []
}
