//
//  ViewState.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/7/22.
//

import Foundation

enum LoadingState {
    case idle
    case loading
    case failed(Error)
    case success
}
