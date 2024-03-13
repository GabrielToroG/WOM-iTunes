//
//  SceneDelegate.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: TabBarCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        // Variables for dependency injection
        let injection = Injection.shared
        let container = injection.getContainer()

        // Configure UINavigationController
        let navController = UINavigationController()
        navController.setNavigationBarHidden(true, animated: false)
        configNavigationController(navController)

        // Dependency injection
        coordinator = TabBarCoordinator(navigationController: navController, container: container)
        injection.controllerProvider.inject(tabBarCoordinator: coordinator)
        coordinator?.start()

        // Configure the window
        let window = UIWindow(windowScene: scene)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }

    private func configNavigationController(_ navController: UINavigationController) {
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [
            .font: Fonts.Heading.backButton,
            .foregroundColor: UIColor.black
        ]

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: Fonts.Heading.heading2,
        ]
        standardAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: Fonts.Heading.heading1,
        ]
        standardAppearance.backButtonAppearance = backButtonAppearance
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.primaryColor
        standardAppearance.shadowColor = .clear
        navController.navigationBar.standardAppearance = standardAppearance
        navController.navigationBar.scrollEdgeAppearance = standardAppearance
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationBar.tintColor = UIColor.black
    }
}

