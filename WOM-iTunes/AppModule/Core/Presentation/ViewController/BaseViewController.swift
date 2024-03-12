//
//  BaseViewController.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit
import Combine

class BaseViewController<V: BaseViewModel, C: Coordinator>: UIViewController {

    // Properties
    let viewModel: V
    let coordinator: C
    let notificationCenter: NotificationCenterWrapper
    var anyCancellable: [AnyCancellable] = []
    private var loadConstraints: [NSLayoutConstraint] = []

    init(
        _ viewModel: V,
        _ coordinator: C,
        _ notificationCenter: NotificationCenterWrapper
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.notificationCenter = notificationCenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.endEditing(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    deinit {
        anyCancellable.forEach { $0.cancel() }
    }
}
