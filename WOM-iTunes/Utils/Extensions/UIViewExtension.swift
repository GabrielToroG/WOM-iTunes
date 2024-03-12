//
//  UIViewExtension.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

extension UIView {
    @objc func onClick(cancelsTouchesInView: Bool = true, _ onClick: @escaping () -> Void) {
        let clickableGestureRecognizer = ClickableGestureRecognizer(
            onClick: onClick,
            target: self,
            action: #selector(callListener(_:)),
            cancelsTouchesInView: cancelsTouchesInView
        )
        addGestureRecognizer(clickableGestureRecognizer)
    }

    @objc private func callListener(_ sender: ClickableGestureRecognizer) {
        sender.onClick()
    }
}
