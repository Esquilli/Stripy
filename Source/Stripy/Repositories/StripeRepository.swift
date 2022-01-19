//
//  NewsWebRepository.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Combine
import CoreLocation
import Foundation

protocol StripeRepositoryProtocol: AnyObject {
    func getPaymentIntent() -> AnyPublisher<CheckoutResponse, Error>
}

final class StripeRepository: StripeRepositoryProtocol {
    private let networker: NetworkServiceProtocol
    
    init(networker: NetworkServiceProtocol = NetworkService()) {
        self.networker = networker
    }
    
    func getPaymentIntent() -> AnyPublisher<CheckoutResponse, Error> {
        let endpoint = Endpoint.Stripe.paymentIntent()
        
        return networker.put(type: CheckoutResponse.self, url: endpoint.url, headers: endpoint.headers)
    }
}
