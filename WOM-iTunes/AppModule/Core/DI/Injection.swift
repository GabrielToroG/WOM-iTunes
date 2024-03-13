//
//  Injection.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Swinject

final class Injection {
    static let shared = Injection()
    private let container: Container
    let controllerProvider: MainControllerProvider

    private init() {
        container = Container()
        controllerProvider = .init(container)
        injectDependencies()
    }

    private func injectDependencies() {
        MainModule(container).inject()
        NetworkModule(container).inject()
        MainTabBarModule(container).inject()
        HomeModule(container).inject()
        SongDetailModule(container).inject()
        WishlistModule(container).inject()
    }

    func getContainer() -> Container {
        return container
    }

    func resolve<T>(_ serviceType: T.Type) -> T {
      return container.resolve(serviceType)!
    }
}
