//
//  GetItunesListUseCase.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class GetItunesListUseCase: ClosureUseCase {
    typealias RequestType = iTunesListQueryParams
    typealias ResultType = UiiTunesResponse
    
    let repository: HomeDataSource
    let mapper: HomeDomainMapper
    
    init(repository: HomeDataSource, mapper: HomeDomainMapper) {
        self.repository = repository
        self.mapper = mapper
    }
    
    func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (ApiResult<ResultType>) -> Void
    ) {
        repository.getItunesList(queryParams: parameters) { [weak self] in
            guard let self = self else { return }
            onCompletion($0.map(self.mapper.domainToPresentation(_:)))
        }
    }
}
