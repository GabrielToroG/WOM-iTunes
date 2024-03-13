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

    func inject(tabBarCoordinator: TabBarCoordinator?) {
        container.register(TabBarCoordinator?.self) { _ in
            tabBarCoordinator
        }
    }
    func getTabBar() -> UITabBarController {
        container.resolve(MainTabBarController.self)!
    }
    func getHome() -> UIViewController {
        container.resolve(HomeViewController.self)!
    }
    func getWishlist() -> UIViewController {
        container.resolve(WishlistViewController.self)!
    }
}
