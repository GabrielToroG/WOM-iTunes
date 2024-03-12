//
//  SceneDelegate.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: InitCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        // Variables for dependency injection
        let injection = Injection.shared
        let container = injection.getContainer()

        // Configure UINavigationController
        let navController = UINavigationController()
        configNavigationController(navController)
        
        // Dependency injection
        coordinator = InitCoordinator(navigationController: navController, container: container)
        Injection.shared.controllerProvider.inject(initCoordinator: coordinator)
        coordinator?.start()

        // Configure the window
        let window = UIWindow(windowScene: scene)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }

    private func configNavigationController(_ navController: UINavigationController) {
        // Cambiar estilos al botón "Back"
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [
            .font: Fonts.Heading.backButton,
            .foregroundColor: UIColor.black
        ]

        // Cambiar estilos
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
        standardAppearance.configureWithOpaqueBackground()          // So that it does not become lighter
        standardAppearance.backgroundColor = UIColor.systemPurple
        standardAppearance.shadowColor = .clear                     // delete border bottom
        navController.navigationBar.standardAppearance = standardAppearance
        navController.navigationBar.scrollEdgeAppearance = standardAppearance
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.tintColor = UIColor.black  // change color to left header, when large titles
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

