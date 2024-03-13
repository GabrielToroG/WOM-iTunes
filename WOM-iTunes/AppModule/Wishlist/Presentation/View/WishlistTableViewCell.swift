//
//  WishlistTableViewCell.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 13-03-24.
//

import UIKit

final class WishlistTableViewCell: UITableViewCell {
    private enum Constants {
        static let favoriteOn: String = "general-icon-favorite-on"
    }

    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.primaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var optionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.Body.body1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var removeFavoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: Constants.favoriteOn), for: .normal)
        button.tintColor = .white
        button.onClick { [weak self] in
            guard let self = self else { return }
            self.tapFavoriteButton?()
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var tapFavoriteButton: (() -> Void)?

    // Config
    var item: UiSongInformation? {
        didSet {
            guard let item = item else { return }
            if let url = URL(string: item.artworkUrl30) {
                optionImageView.setStyle(.networking)
                optionImageView.setImage(from: url)
            }
            trackNameLabel.text = item.trackName
        }
    }

    // Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
}

extension WishlistTableViewCell {
    private func configUI() {
        configConstraints()
    }
    private func configConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubview(optionImageView)
        containerView.addSubview(trackNameLabel)
        containerView.addSubview(removeFavoriteButton)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor)
        ]
        let optionImageViewConstraints = [
            optionImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            optionImageView.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            optionImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Icon.normal),
            optionImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Icon.normal)
        ]
        let trackNameLabelConstraints = [
            trackNameLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Dimensions.Margin.small),
            trackNameLabel.leadingAnchor.constraint(
                equalTo: optionImageView.trailingAnchor,
                constant: Dimensions.Margin.normal),
            trackNameLabel.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -Dimensions.Margin.small)
        ]
        let removeFavoriteButtonConstraints = [
            removeFavoriteButton.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            removeFavoriteButton.leadingAnchor.constraint(
                equalTo: trackNameLabel.trailingAnchor,
                constant: Dimensions.Margin.normal),
            removeFavoriteButton.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.normal),
            removeFavoriteButton.widthAnchor.constraint(
                equalToConstant: Dimensions.Icon.normal),
            removeFavoriteButton.heightAnchor.constraint(
                equalToConstant: Dimensions.Icon.normal)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            optionImageViewConstraints +
            trackNameLabelConstraints +
            removeFavoriteButtonConstraints
        )
    }
}
