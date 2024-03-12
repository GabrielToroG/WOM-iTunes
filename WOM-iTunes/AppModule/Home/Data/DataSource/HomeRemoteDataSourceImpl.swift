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
            endpoint: "/search",
            method: .GET,
            headerType: .authenticated,
            queryParams: queryParams.asDictionary(),
            onCompletion: completion)
    }
}
