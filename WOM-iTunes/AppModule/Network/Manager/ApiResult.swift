//
//  ApiResult.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

enum ApiResult<T> {
    case success(data: T)
    case error(error: ErrorType)
    case unauthorized(error: Error)
}
