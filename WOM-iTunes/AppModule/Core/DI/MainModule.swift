//
//  MainModule.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Swinject

final class MainModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        container.register(Coordinator.self) { _ in
                .init(container: self.container)
        }
        container.register(NotificationCenter.self) { _ in
            .default
        }
        container.register(NotificationCenterWrapper.self) { resolver in
            NotificationCenterWrapperImpl(
                notificationCenter: resolver.resolve(NotificationCenter.self)!)
        }
    }
}
