//
//  ServiceLayer.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

protocol ServiceLayer {
    func request<R: Decodable>(
        endpoint: String,
        method: HttpMethod,
        onCompletion: @escaping (ApiResult<R>) -> Void
    )

    func requestWithQueryParams<R: Decodable>(
        endpoint: String,
        method: HttpMethod,
        queryParams: [String: Any],
        onCompletion: @escaping (ApiResult<R>) -> Void
    )
}
