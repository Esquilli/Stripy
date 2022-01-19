//
//  WeatherOneCallResponse.swift
//  Frosti
//
//  Created by Pedro Fernandez on 1/10/22.
//

import Foundation

struct CheckoutResponse: Codable {
    let publishableKey, paymentIntent, customer, ephemeralKey: String
}
