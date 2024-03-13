//
//  CoordinatorProtocol.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    func didDeinit(_ coordinator: CoordinatorProtocol)
    func start()
}
