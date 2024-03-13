//
//  WishlistModule.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

import Swinject

final class WishlistModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension WishlistModule {
    func injectPresentation() {
        container.register(WishlistViewModel.self) { resolver in
            WishlistViewModel()
        }
        container.register(WishlistCoordinator.self) { resolver in
            WishlistCoordinator(container: self.container)
        }
        container.register(WishlistViewController.self) { resolver in
            WishlistViewController(
                resolver.resolve(WishlistViewModel.self)!,
                resolver.resolve(WishlistCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
