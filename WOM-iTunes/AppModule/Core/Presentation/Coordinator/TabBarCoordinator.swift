//
//  TabBarCoordinator.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation
import Swinject

class TabBarCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    private let container: Container
    weak var parentCoordinator: CoordinatorProtocol?

    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func didDeinit(_ coordinator: CoordinatorProtocol) {
        
    }
    
    func start() {
        let mainTabBarController = Injection.shared.controllerProvider.getTabBar()
        navigationController.pushViewController(mainTabBarController, animated: true)
    }
    
    func reset() {
        
    }
}
