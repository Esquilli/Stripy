//
//  LocationError.swift
//  Frosti
//
//  Created by Pedro Fernandez on 1/12/22.
//

import Foundation

enum LocationError: Error {
    case unauthorized
    case unableToDetermineLocation
}

extension LocationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "The app does not have location permissions. Please enable them in settings"
        case .unableToDetermineLocation:
            return "Unable to determine your current location."
        }
    }
}
