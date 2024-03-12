//
//  HomeRepository.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

class HomeRepository: HomeDataSource {

    private let remote: HomeRemoteDataSource
    private let mapper: HomeDataMapper
    init(
        remote: HomeRemoteDataSource,
        mapper: HomeDataMapper
    ) {
        self.remote = remote
        self.mapper = mapper
    }

    func getItunesList(
        queryParams: iTunesListQueryParams,
        onCompletion: @escaping (ApiResult<DomainiTunesResponse>) -> Void
    ) {
        remote.getItunesList(
            queryParams: mapper.domainToData(queryParams)
        ) { [mapper] in
            onCompletion($0.map(mapper.dataToDomain))
        }
    }
}
