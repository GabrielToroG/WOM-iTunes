//
//  HomeDataSource.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

protocol HomeDataSource {
    func getItunesList(
        queryParams: iTunesListQueryParams,
        onCompletion: @escaping (ApiResult<DomainiTunesResponse>) -> Void
    )
}
