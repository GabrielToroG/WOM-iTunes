//
//  MainControllerProvider.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Swinject

final class MainControllerProvider {
    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject(initCoordinator: InitCoordinator?) {
        container.register(InitCoordinator?.self) { _ in
            initCoordinator
        }
    }
    func getHome() -> UIViewController {
        container.resolve(HomeViewController.self)!
    }
}
