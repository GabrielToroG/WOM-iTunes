//
//  Fonts.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

enum Fonts {
    private enum FontName {
        enum Montserrat {
            static let light = "Montserrat-Light"
            static let regular = "Montserrat-Regular"
            static let semiBold = "Montserrat-SemiBold"
            static let bold = "Montserrat-Bold"
        }
    }

    // Se definen las fuentes de sistema, en caso de no funcionar las otras
    enum SysFont {
        static let boldSize30 = UIFont.systemFont(ofSize: 30, weight: .bold)
        static let boldSize20 = UIFont.systemFont(ofSize: 20, weight: .bold)
        static let boldSize19 = UIFont.systemFont(ofSize: 19, weight: .bold)
        static let boldSize18 = UIFont.systemFont(ofSize: 18, weight: .bold)
        static let boldSize17 = UIFont.systemFont(ofSize: 17, weight: .bold)
        static let boldSize16 = UIFont.systemFont(ofSize: 16, weight: .bold)
        static let boldSize15 = UIFont.systemFont(ofSize: 15, weight: .bold)
        static let boldSize14 = UIFont.systemFont(ofSize: 14, weight: .bold)
        static let boldSize13 = UIFont.systemFont(ofSize: 13, weight: .bold)
        static let boldSize12 = UIFont.systemFont(ofSize: 12, weight: .bold)
        static let boldSize11 = UIFont.systemFont(ofSize: 11, weight: .bold)
        static let boldSize10 = UIFont.systemFont(ofSize: 10, weight: .bold)

        static let semiboldSize30 = UIFont.systemFont(ofSize: 30, weight: .semibold)
        static let semiboldSize20 = UIFont.systemFont(ofSize: 20, weight: .semibold)
        static let semiboldSize19 = UIFont.systemFont(ofSize: 19, weight: .semibold)
        static let semiboldSize18 = UIFont.systemFont(ofSize: 18, weight: .semibold)
        static let semiboldSize17 = UIFont.systemFont(ofSize: 17, weight: .semibold)
        static let semiboldSize16 = UIFont.systemFont(ofSize: 16, weight: .semibold)
        static let semiboldSize15 = UIFont.systemFont(ofSize: 15, weight: .semibold)
        static let semiboldSize14 = UIFont.systemFont(ofSize: 14, weight: .semibold)
        static let semiboldSize13 = UIFont.systemFont(ofSize: 13, weight: .semibold)
        static let semiboldSize12 = UIFont.systemFont(ofSize: 12, weight: .semibold)
        static let semiboldSize11 = UIFont.systemFont(ofSize: 11, weight: .semibold)
        static let semiboldSize10 = UIFont.systemFont(ofSize: 10, weight: .semibold)

        static let regularSize30 = UIFont.systemFont(ofSize: 30, weight: .regular)
        static let regularSize20 = UIFont.systemFont(ofSize: 20, weight: .regular)
        static let regularSize19 = UIFont.systemFont(ofSize: 19, weight: .regular)
        static let regularSize18 = UIFont.systemFont(ofSize: 18, weight: .regular)
        static let regularSize17 = UIFont.systemFont(ofSize: 17, weight: .regular)
        static let regularSize16 = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let regularSize15 = UIFont.systemFont(ofSize: 15, weight: .regular)
        static let regularSize14 = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let regularSize13 = UIFont.systemFont(ofSize: 13, weight: .regular)
        static let regularSize12 = UIFont.systemFont(ofSize: 12, weight: .regular)
        static let regularSize11 = UIFont.systemFont(ofSize: 11, weight: .regular)
        static let regularSize10 = UIFont.systemFont(ofSize: 10, weight: .regular)
    }

    enum Body {
        /// Montserrat semiBold 17
        static let body1 = UIFont(name: FontName.Montserrat.semiBold, size: 17) ?? SysFont.regularSize17
        /// Montserrat regular 14
        static let body2 = UIFont(name: FontName.Montserrat.regular, size: 14) ?? SysFont.regularSize14
    }
}
