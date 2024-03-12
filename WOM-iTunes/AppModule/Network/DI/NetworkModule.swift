//
//  NetworkModule.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation
import Swinject

final class NetworkModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension NetworkModule {
    func injectPresentation() {
        container.register(ServiceLayer.self) { _ in
            ServiceLayerImpl()
        }
    }
}
