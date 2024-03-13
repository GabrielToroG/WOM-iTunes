//
//  BaseViewModel.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation
import Combine

open class BaseViewModel {

    @Published var isLoading: Bool = false

    public init() {}
}
