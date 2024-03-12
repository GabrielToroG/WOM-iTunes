//
//  SongDetailViewController.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

final class SongDetailViewController: BaseViewController<SongDetailViewModel, SongDetailCoordinator> {
    // Outlets
    // Properties
}

// MARK: - Lifecycle
extension SongDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
    }
}

// MARK: - Bindings
extension SongDetailViewController {
    private func configBindings() {
        
    }
}

// MARK: - UI Functions
extension SongDetailViewController {
    private func configUI() {
        configConstraints()
    }
    
    private func configConstraints() {
        
    }
}
