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

extension ApiResult {
    func map<R>(_ transform: (T) -> R) -> ApiResult<R> {
        switch self {
        case .success(let data):
            return ApiResult<R>.success(data: transform(data))
        case .error(let error):
            return ApiResult<R>.error(error: error)
        case .unauthorized(let error):
            return ApiResult<R>.unauthorized(error: error)
        }
    }
}
