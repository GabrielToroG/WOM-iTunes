//
//  ServerConstants.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

struct ServerConstants {
    static let UNAUTHORIZED = 401
    static let InvalidAccessToken = 403
    static let notFound = 404
    enum Base {
        static let contentType = "application/json"
        static let unAuthorized = 401
    }
    enum Songs {
        static let basePath = "/search"
    }
}
