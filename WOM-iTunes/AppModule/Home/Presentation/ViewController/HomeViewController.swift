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
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension HomeViewController {
    private func configBindings() {
        viewModel.$uniqueMusics.sink { _ in } receiveValue: { value in
            
        }.store(in: &anyCancellable)
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
