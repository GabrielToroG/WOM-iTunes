//
//  HomeViewController.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation
import UIKit

final class HomeViewController: BaseViewController<HomeViewModel, HomeCoordinator> {
    // Outlets
    // Properties
}

// MARK: - Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
    }
}

// MARK: - Bindings
extension HomeViewController {
    private func configBindings() {
        
    }
}

// MARK: - UI Functions
extension HomeViewController {
    private func configUI() {
        view.backgroundColor = .systemYellow
        configConstraints()
    }
    
    private func configConstraints() {
        
    }
}
