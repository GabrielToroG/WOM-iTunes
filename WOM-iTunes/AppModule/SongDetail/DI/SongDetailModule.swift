//
//  SongDetailModule.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation
import Swinject

final class SongDetailModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension SongDetailModule {
    func injectPresentation() {
        container.register(SongDetailViewModel.self) { (resolver, args) in
            SongDetailViewModel(
                resolver.resolve(FavoriteProductsManager.self)!,
                args
            )
        }
        container.register(SongDetailCoordinator.self) { resolver in
            SongDetailCoordinator(container: self.container)
        }
        container.register(SongDetailViewController.self) { (resolver, args: SongDetailArgs) in
            SongDetailViewController(
                resolver.resolve(SongDetailViewModel.self, argument: args)!,
                resolver.resolve(SongDetailCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
