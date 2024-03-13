//
//  MainTabBarController.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

final class MainTabBarController: UITabBarController {

    private var homeViewController: UIViewController!
    private var wishlistViewController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        configVCs()
        configColorsTabs()
    }

    private func configVCs() {
        homeViewController = Injection.shared.controllerProvider.getHome()
        wishlistViewController = Injection.shared.controllerProvider.getWishlist()
        let newViewControllers = [
            createNavController(
                for: homeViewController,
                title: "Inicio",
                image: UIImage(systemName: "house")!
            ),
            createNavController(
                for: wishlistViewController,
                title: "Favoritos",
                image: UIImage(systemName: "star")!
            )
        ]

        for (index, item) in newViewControllers.enumerated() {
            item.tabBarItem.tag = index
        }
        setViewControllers(newViewControllers, animated: false)
    }

    private func createNavController(
        for rootViewController: UIViewController,
        title: String,
        image: UIImage
    ) -> UIViewController {
        let navController = UINavigationController(
            rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        configNavigations(navController)
        return navController
    }

    private func configColorsTabs() {
        let customTabBarAppearance = UITabBarAppearance()
        let textAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black]
        customTabBarAppearance.backgroundColor = .white
        customTabBarAppearance.stackedLayoutAppearance.normal.iconColor = .black
        customTabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = textAttributes
        tabBar.scrollEdgeAppearance = customTabBarAppearance
        tabBar.backgroundColor = .white
        tabBar.tintColor = .primaryColor
        tabBar.unselectedItemTintColor = .black
    }

    private func configNavigations(_ nav: UINavigationController) {
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [
            .font: Fonts.Heading.backButton,
            .foregroundColor: UIColor.white
        ]

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: Fonts.Heading.heading2,
        ]
        standardAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: Fonts.Heading.heading1,
        ]
        standardAppearance.backButtonAppearance = backButtonAppearance
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.primaryColor
        standardAppearance.shadowColor = .clear
        nav.navigationBar.standardAppearance = standardAppearance
        nav.navigationBar.scrollEdgeAppearance = standardAppearance
        nav.navigationBar.prefersLargeTitles = false
        nav.navigationBar.tintColor = UIColor.white
    }
}
