//
//  HomeRemoteDataSourceImpl.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class HomeRemoteDataSourceImpl: HomeRemoteDataSource {

    private let manager: ServiceLayer
    init(manager: ServiceLayer) {
        self.manager = manager
    }

    func getItunesList(
        queryParams: ApiiTunesListQueryParams,
        completion: @escaping(ApiResult<ApiiTunesResponse>) -> Void
    ) {
        manager.requestWithQueryParams(
            endpoint: ServerConstants.Songs.basePath,
            method: .GET,
            queryParams: queryParams.asDictionary(),
            onCompletion: completion)
    }
}
