//
//  HomeCoordinator.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

final class HomeCoordinator: Coordinator {

    indirect enum GoToScene: Equatable {
        case songDetail(SongDetailArgs)
    }

    func goToScene(
        scene: GoToScene,
        from viewController: UIViewController
    ) {
        switch scene {
        case .songDetail(let args):
            pushViewController(
                viewController: viewController,
                newViewControllerType: SongDetailViewController.self,
                args: [args]
            )
        }
    }
}
