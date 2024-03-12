//
//  HomeDataSource.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

protocol HomeRemoteDataSource {
    func getItunesList(
        queryParams: ApiiTunesListQueryParams,
        completion: @escaping(ApiResult<ApiiTunesResponse>) -> Void
    )
}
