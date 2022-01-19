//
//  NetworkError.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the object"
        case .errorCode(let code):
            return "\(code) - error code from API"
        case .unknown:
            return "Something went wrong"
        }
    }
}
