//
//  HomeTableViewCell.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

// MARK: - Class
final class HomeTableViewCell: UITableViewCell {

    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPurple
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
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Config
    var item: UiSongInformation? {
        didSet {
            guard let item = item else { return }
            trackNameLabel.text = item.trackName
            artistNameLabel.text = item.artistName
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

// MARK: - UI Functions
extension HomeTableViewCell {
    private func configUI() {
        configConstraints()
    }
    private func configConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubview(optionImageView)
        containerView.addSubview(trackNameLabel)
        containerView.addSubview(artistNameLabel)

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
            trackNameLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]
        let artistNameLabelConstraints = [
            artistNameLabel.topAnchor.constraint(
                equalTo: trackNameLabel.bottomAnchor,
                constant: .zero),
            artistNameLabel.leadingAnchor.constraint(
                equalTo: optionImageView.trailingAnchor,
                constant: Dimensions.Margin.normal),
            artistNameLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.normal),
            artistNameLabel.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -Dimensions.Margin.small)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            optionImageViewConstraints +
            trackNameLabelConstraints +
            artistNameLabelConstraints
        )
    }
}
