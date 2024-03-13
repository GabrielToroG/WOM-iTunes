//
//  BaseViewModel.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation
import Combine

open class BaseViewModel {
    private enum Constants {
        static let errorText: String = "Error"
        static let connectionError: String = "Error de conexión"
        static let notFoundError: String = "No encontrado"
    }

    @Published var isLoading: Bool = false
    @Published var errorType: ErrorArgs = .init(title: "", description: "")

    public init() {}

    func onError(_ errorType: ErrorType) {
        self.errorType = getArgs(for: errorType)
    }

    func getArgs(for errorType: ErrorType) -> ErrorArgs {
        switch errorType {
        case .connection:
            return .init(
                title: Constants.errorText,
                description: Constants.connectionError
            )
        case .api(let apiError):
            return .init(
                title: Constants.errorText,
                description: apiError.error
            )
        case .general(let error):
            return .init(
                title: Constants.errorText,
                description: error?.localizedDescription
            )
        case .inward(let error):
            return .init(
                title: Constants.errorText,
                description: error.message
            )
        case .notFound:
            return .init(
                title: Constants.errorText,
                description: Constants.notFoundError
            )
        case .generic(let message):
            return .init(
                title: Constants.errorText,
                description: message
            )
        }
    }
}
