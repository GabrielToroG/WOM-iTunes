//
//  SongDetailViewController.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

final class SongDetailViewController: BaseViewController<SongDetailViewModel, SongDetailCoordinator> {
    private lazy var songImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.layer.cornerRadius = Dimensions.CornerRadius.normal
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.Body.body1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.Body.body2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension SongDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
    }
}

extension SongDetailViewController {
    private func configBindings() {
        viewModel.$args.sink { [weak self] args in
            guard let self = self else { return }
            if let url = URL(string: args.information.artworkUrl100) {
                songImageView.setStyle(.networking)
                songImageView.setImage(from: url)
            }
            trackNameLabel.text = args.information.trackName
            artistNameLabel.text = args.information.artistName
        }.store(in: &anyCancellable)
    }
}

extension SongDetailViewController {
    private func configUI() {
        view.backgroundColor = .systemPurple
        configConstraints()
    }

    private func configConstraints() {
        view.addSubview(songImageView)
        view.addSubview(trackNameLabel)
        view.addSubview(artistNameLabel)

        let songImageViewConstraints = [
            songImageView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -Dimensions.Margin.extreme),
            songImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.ImageView.big),
            songImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.ImageView.big),
            songImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)
        ]
        let trackNameLabelConstraints = [
            trackNameLabel.topAnchor.constraint(
                equalTo: songImageView.bottomAnchor,
                constant: Dimensions.Margin.normal),
            trackNameLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Dimensions.Margin.normal),
            trackNameLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]
        let artistNameLabelConstraints = [
            artistNameLabel.topAnchor.constraint(
                equalTo: trackNameLabel.bottomAnchor,
                constant: Dimensions.Margin.normal),
            artistNameLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Dimensions.Margin.normal),
            artistNameLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]

        NSLayoutConstraint.activate(
            songImageViewConstraints +
            trackNameLabelConstraints +
            artistNameLabelConstraints
        )
    }
}
