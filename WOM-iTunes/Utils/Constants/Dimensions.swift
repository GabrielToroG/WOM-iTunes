//
//  Dimensions.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

enum Dimensions {
    enum Margin {
        /// CGFloat = 0
        static let zero: CGFloat = 0
        /// CGFloat = 4
        static let tiny: CGFloat = 4
        /// CGFloat = 8
        static let small: CGFloat = 8
        /// CGFloat = 16
        static let normal: CGFloat = 16
        /// CGFloat = 32
        static let big: CGFloat = 32
        /// CGFloat = 64
        static let extreme: CGFloat = 64
    }

    enum CornerRadius {
        /// CGFloat = 16
        static let normal: CGFloat = 16
    }
    
    enum Icon {
        /// CGFloat = 32
        static let normal: CGFloat = 32
    }

    enum ImageView {
        /// CGFLoat = 80
        static let normal: CGFloat = 80
        /// CGFLoat = 160
        static let big: CGFloat = 160
    }
}
