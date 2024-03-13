//
//  WishlistViewController.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

final class WishlistViewController: BaseViewController<WishlistViewModel, WishlistCoordinator> {

    // Outlets
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
}

// MARK: - Lifecycle
extension WishlistViewController {
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

// MARK: - Bindings
extension WishlistViewController {
    private func configBindings() {
        viewModel.$refresh.sink { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }.store(in: &anyCancellable)
    }
}

// MARK: - UI Functions
extension WishlistViewController {
    private func configUI() {
        view.backgroundColor = UIColor.primaryColor
        configTableView()
        configConstraints()
    }

    private func configTableView() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.registerCellClass(for: WishlistTableViewCell.self)
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

extension WishlistViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: WishlistTableViewCell.self, for: indexPath)
        cell.item = viewModel.songs[indexPath.row]
        cell.tapFavoriteButton = { [weak self] in
            guard let self = self else { return }
            self.viewModel.removeWishlist(index: indexPath.row)
        }
        return cell
    }
}
