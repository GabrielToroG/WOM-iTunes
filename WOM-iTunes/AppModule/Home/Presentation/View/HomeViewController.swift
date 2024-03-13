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
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
}

extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.onViewWillAppear()
    }
}

extension HomeViewController {
    private func configBindings() {
        viewModel.$goTo.sink { [weak self] scene in
            guard let self = self, let scene = scene else { return }
            self.coordinator.goToScene(scene: scene, from: self)
        }.store(in: &anyCancellable)

        viewModel.$uniqueMusics.sink { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }.store(in: &anyCancellable)
    }
}

// MARK: - UI Functions
extension HomeViewController {
    private func configUI() {
        view.backgroundColor = UIColor.primaryColor
        configTableView()
        configConstraints()
    }

    private func configTableView() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.registerCellClass(for: HomeTableViewCell.self)
    }

    private func configConstraints() {
        view.addSubview(mainTableView)
        let tableViewConstraints = [
            mainTableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Dimensions.Margin.tiny),
            mainTableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.uniqueMusics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: HomeTableViewCell.self, for: indexPath)
        cell.item = viewModel.uniqueMusics[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToSongDetail(index: indexPath.row)
    }
}
