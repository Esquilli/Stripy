//
//  MyBackendModel.swift
//  Stripy
//
//  Created by Pedro Fernandez on 1/18/22.
//

import Combine
import Stripe
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var state: LoadingState = .idle
    @Published var paymentSheet: PaymentSheet?
    @Published var paymentResult: PaymentSheetResult?
    
    private var cancellables = Set<AnyCancellable>()
    private let stripeRepository: StripeRepositoryProtocol
    
    init(stripeRepository: StripeRepositoryProtocol) {
        self.stripeRepository = stripeRepository
    }
    
    func preparePaymentSheet() {
        self.state = .loading
        
        stripeRepository.getPaymentIntent()
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion {
            case .finished:
                self.state = .success
            case .failure(let error):
                self.state = .failed(error)
            }

        } receiveValue: { [weak self] response in
            STPAPIClient.shared.publishableKey = response.publishableKey
            
            var configuration = PaymentSheet.Configuration()
            configuration.merchantDisplayName = "Esquilli, Inc."
            configuration.applePay = .init(
              merchantId: "merchant.com.your_app_name",
              merchantCountryCode: "US"
            )
            configuration.customer = .init(id: response.customer, ephemeralKeySecret: response.ephemeralKey)
            
            DispatchQueue.main.async {
                self?.paymentSheet = PaymentSheet(paymentIntentClientSecret: response.paymentIntent, configuration: configuration)
            }
        }
        .store(in: &cancellables)
    }
    
    func onPaymentCompletion(result: PaymentSheetResult) {
        self.paymentResult = result
    }
}
