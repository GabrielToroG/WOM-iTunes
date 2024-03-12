//
//  HomeModule.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Swinject

final class HomeModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension HomeModule {
    func injectPresentation() {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel()
        }
        container.register(HomeCoordinator.self) { resolver in
            HomeCoordinator(container: self.container)
        }
        container.register(HomeViewController.self) { resolver in
            HomeViewController(
                resolver.resolve(HomeViewModel.self)!,
                resolver.resolve(HomeCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
