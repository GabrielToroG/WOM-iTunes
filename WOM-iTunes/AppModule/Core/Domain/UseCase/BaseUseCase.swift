//
//  BaseUseCase.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

protocol BaseUseCase {
    associatedtype RequestType
    associatedtype ResultType

    func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (Result<ResultType, Error>) -> Void
    )
}
