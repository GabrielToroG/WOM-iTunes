//
//  Coordinator.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation
import Swinject

class Coordinator {
    private let container: Container

    public init(container: Container) {
        self.container = container
    }

    private func resolveArguments<V: UIViewController>(
        _ newViewControllerType: V.Type,
        _ name: String? = nil
    ) -> V {
        container.resolve(V.self, name: name)!
    }

    private func resolveArguments<V: UIViewController, T>(
        _ newViewControllerType: V.Type,
        _ name: String? = nil,
        _ args: [T]
    ) -> V {
        container.resolve(V.self, name: name, argument: args[0])!
    }
}

extension Coordinator {
    func pushViewController<V: UIViewController>(
        viewController: UIViewController,
        newViewControllerType: V.Type,
        animated: Bool = false
    ) {
        var newViewController: V!
        newViewController = resolveArguments(newViewControllerType)
        viewController.navigationController?.pushViewController(newViewController, animated: animated)
    }

    func pushViewController<V: UIViewController, T>(
        viewController: UIViewController,
        newViewControllerType: V.Type,
        args: [T]
    ) {
        var newViewController: V!
        newViewController = resolveArguments(newViewControllerType, nil, args)
        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }
}
