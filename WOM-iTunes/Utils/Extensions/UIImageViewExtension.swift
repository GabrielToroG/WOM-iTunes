//
//  UIImageViewExtension.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation
import SDWebImage

extension UIImageView {
    enum Style {
        case networking
    }

    /// Función para usar una imagen que viene desde una url, importante para imagenes que vienen desde backend.
    func setImage(
        from url: URL?,
        with options: SDWebImageOptions = [.continueInBackground, .highPriority, .avoidAutoSetImage],
        and forcingTintColor: Bool = false,
        completion: ((UIImage?) -> Void)? = nil
    ) {
        guard let url = url else { return }
        self.sd_setImage(
            with: url,
            placeholderImage: nil,
            options: options
        ) { [weak self] image , _, _, _ in
            if forcingTintColor {
                self?.image = image?.withRenderingMode(.alwaysTemplate)
            } else {
                self?.image = image?.withRenderingMode(.alwaysOriginal)
            }
            completion?(image)
        }
    }

    func setStyle(_ style: Style) {
        switch style {
        case .networking:
            sd_imageIndicator = SDWebImageActivityIndicator.gray
            sd_imageTransition = SDWebImageTransition.fade
        }
    }
}
