//
//  BaseViewController.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit
import Combine

class BaseViewController<V: BaseViewModel, C: Coordinator>: UIViewController {

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

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
        suscribeToLoading()
        suscribeToError()
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

extension BaseViewController {
    private func showLoading(_ value: Bool) {
        if value {
            self.addLoadConstraint()
        } else {
            self.removeLoadConstraint()
        }
    }

    private func addLoadConstraint() {
        view.addSubview(activityIndicator)
        loadConstraints = [
            activityIndicator.topAnchor.constraint(equalTo: view.topAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]
        NSLayoutConstraint.activate(loadConstraints)
    }

    private func removeLoadConstraint() {
        NSLayoutConstraint.deactivate(loadConstraints)
        loadConstraints.removeAll()
        self.activityIndicator.removeFromSuperview()
    }
    
    private func suscribeToLoading() {
        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.showLoading(value)
            }
            .store(in: &anyCancellable)
    }
}

extension BaseViewController {
    private func suscribeToError() {
        viewModel.$errorType
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                if !value.title.isEmpty {
                    let alertController = UIAlertController(
                        title: value.title,
                        message: value.description,
                        preferredStyle: .alert
                    )
                    let okAction = UIAlertAction(
                        title: "Ok",
                        style: .cancel,
                        handler: nil
                    )
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            .store(in: &anyCancellable)
    }
}
