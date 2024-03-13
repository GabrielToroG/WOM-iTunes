//
//  ClosureUseCase.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

protocol ClosureUseCase {
    associatedtype RequestType
    associatedtype ResultType

    func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (ApiResult<ResultType>) -> Void
    )
}

protocol UseCase: Reusable {
    associatedtype RequestType
    associatedtype ResultType

    func execute(
        _ parameters: RequestType
    ) -> ApiResult<ResultType>
}
