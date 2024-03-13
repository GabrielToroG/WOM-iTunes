//
//  MainTabBarModule.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

import Swinject

final class MainTabBarModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension MainTabBarModule {
    func injectPresentation() {
        container.register(MainTabBarController.self) { resolver in
            return MainTabBarController()
        }
    }
}
