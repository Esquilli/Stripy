//
//  HomeView.swift
//  Stripy
//
//  Created by Pedro Fernandez on 1/18/22.
//

import Stripe
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel(stripeRepository: StripeRepository())
    
    var body: some View {
        VStack(spacing: 20) {
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .success:
                if let paymentSheet = viewModel.paymentSheet {
                    PaymentSheet.PaymentButton(
                        paymentSheet: paymentSheet,
                        onCompletion: viewModel.onPaymentCompletion
                    ) {
                        Text("Buy")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 35)
                            .background(.blue)
                            .clipShape(Capsule())
                    }
                }
                    
                if let result = viewModel.paymentResult {
                    switch result {
                    case .completed:
                        Text("Payment complete")
                    case .failed(let error):
                        Text("Payment failed: \(error.localizedDescription)")
                    case .canceled:
                        Text("Payment canceled.")
                    }
                }
            case .failed(let error):
                StateView(title: "Uh oh!", subtitle: error.localizedDescription)
            }
        }.onAppear(perform: viewModel.preparePaymentSheet)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
