//
//  ClosureUseCase.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

/// Usado para las peticiones API o cualquier Remote data source
protocol ClosureUseCase {
    associatedtype RequestType
    associatedtype ResultType

    func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (ApiResult<ResultType>) -> Void
    )
}

/// Usado para la información local o cualquier Local data source
protocol UseCase: Reusable {
    associatedtype RequestType
    associatedtype ResultType

    func execute(
        _ parameters: RequestType
    ) -> ApiResult<ResultType>
}




enum ErrorType: Error {
    case notFound
    case connection
    case api(_ apiError: ApiError)
    case general(_ error: Error? = nil)
    case inward(_ error: InwardError)
    case generic(_ error: String)
}

struct ApiError: Decodable {
    let statusCode: Int?
    let error: String?
    let message: String?
    let errorCode: String?
}

enum InwardError {
    case malformedUrl
    case decoding
    case emptyResponse
    case timeout

    var message: String {
        switch self{
        case .malformedUrl:
            return "mal formado"
        case .decoding:
            return "decoding"
        case .emptyResponse:
            return "respuesta vaica"
        case .timeout:
            return "timeout"
        }
    }
}
