//
//  ServiceLayerImpl.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation
import UIKit

final class ServiceLayerImpl: ServiceLayer {
    
    // Properties
    private let decoder = JSONDecoder()
    private var baseUrl: String {
        "https://itunes.apple.com"
    }

    func request<R: Decodable>(
        endpoint: String,
        method: HttpMethod,
        headerType: ApiHeaderType,
        onCompletion: @escaping (ApiResult<R>) -> Void
    ) {
        guard let encodedEndpoint = (baseUrl + endpoint)
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedEndpoint) else {
            return onCompletion(.error(error: .inward(.malformedUrl)))
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            self.handleResponse(
                response,
                request,
                data: data,
                error: error,
                onCompletion: onCompletion)
        }
        
        task.resume()
    }
    
    func requestWithQueryParams<R: Decodable>(
        endpoint: String,
        method: HttpMethod,
        headerType: ApiHeaderType,
        queryParams: [String: Any],
        onCompletion: @escaping (ApiResult<R>) -> Void
    ) {
        guard var components = URLComponents(string: baseUrl + endpoint) else {
            return onCompletion(.error(error: .inward(.malformedUrl)))
        }
        
        components.queryItems = buildQueryItem(from: queryParams)
        
        guard let encodedEndpoint = components.string,
              let encodedURL = encodedEndpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURL)
        else {
            return onCompletion(.error(error: .inward(.malformedUrl)))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            self.handleResponse(
                response,
                request,
                data: data,
                error: error,
                onCompletion: onCompletion)
        }
        
        task.resume()
    }
}

private extension ServiceLayerImpl {
    func buildQueryItem(from queryItems: [String: Any?]) -> [URLQueryItem] {
        var result: [URLQueryItem] = []
        queryItems.forEach { key, value in
            var items: [URLQueryItem] = []
            if let value = value as? [Any?] {
                items = value.compactMap {
                    guard let value = $0 else { return nil }
                    return URLQueryItem(name: "(key)[]", value: String(describing: value))
                }
            } else {
                if let value = value {
                    items = [URLQueryItem(name: key, value: String(describing: value))]
                }
            }
            result.append(contentsOf: items)
        }
        return result
    }

    func handleResponse<R: Decodable>(
        _ response: URLResponse?,
        _ request: URLRequest,
        data: Data?,
        error: Error?,
        onCompletion: @escaping (ApiResult<R>) -> Void
    ) {
        guard let httpResponse = response as? HTTPURLResponse else {
            return onCompletion(.error(error: .inward(.emptyResponse)))
        }
        print("\n*************************************************\n")
        if let url = response?.url,
           let responseData = data,
           let dataString = String(data: responseData, encoding: .utf8) {
            
            print("""
            [Request]: (\(request.httpMethod ?? "Error")) \(url)
                [Headers]: \(request.allHTTPHeaderFields ?? [:])
                [Body]:
            [Response]:
                [Status Code]: \(httpResponse.statusCode)
                [Body]: \(dataString)
            """)
        }
        print("\n*************************************************\n")

        switch httpResponse.statusCode {
        case 200..<300:
            handleSuccess(data: data, statusCode: httpResponse.statusCode, onCompletion)
        default:
            onError(error, data, httpResponse.statusCode, onCompletion)
        }
    }

    func handleSuccess<R: Decodable>(
        data: Data?,
        statusCode: Int,
        _ onCompletion: @escaping (ApiResult<R>) -> Void
    ) {
        if R.self is Bool.Type {
            return onCompletion(.success(data: true as! R))
        }
        
        if statusCode == 204 {
            return onCompletion(.success(data: ApiEmptyResponse() as! R))
        }
        
        guard let data = data else {
            return onCompletion(.error(error: .inward(.emptyResponse)))
        }
        
        do {
            let decoder = JSONDecoder()
            let dataAsObject = try decoder.decode(R.self, from: data)
            onCompletion(.success(data: dataAsObject))
        } catch {
            print("Decoding error: \(error)")
            onCompletion(.error(error: .inward(.decoding)))
        }
    }
    
    func onError<R: Decodable>(
        _ error: Error?,
        _ data: Data?,
        _ statusCode: Int?,
        _ onCompletion: @escaping (ApiResult<R>) -> Void
    ) {
        debugPrint(error ?? "An error ocurred making a request")
        if let error = error {
            guard statusCode != NSURLErrorTimedOut else {
                return onCompletion(.error(error: .inward(.timeout)))
            }
            guard !isNotFound(statusCode) || data != nil else {
                return onCompletion(.error(error: .notFound))
            }
            guard isInvalidToken(statusCode: statusCode) else {
                return onCompletion(ApiResult.unauthorized(error: error))
            }
            if isAuthorized(statusCode: statusCode) {
                decodeErrorBody(data: data, onCompletion: onCompletion)
            } else {
                onCompletion(ApiResult.unauthorized(error: error))
            }
        } else {
            onCompletion(ApiResult.error(error: .general()))
        }
    }
    
    func decodeErrorBody<R>(
        data: Data?,
        onCompletion: @escaping (ApiResult<R>) -> Void
    ) {
        if let dataAsJson = data {
            do {
                let apiError = try decoder.decode(ApiError.self, from: dataAsJson)
                onCompletion(ApiResult.error(error: .api(apiError)))
            } catch {
                onCompletion(ApiResult.error(error: .general()))
            }
        } else {
            onCompletion(ApiResult.error(error: .general()))
        }
    }
    
    func isAuthorized( statusCode: Int?) -> Bool {
        return statusCode != ServerConstants.UNAUTHORIZED
    }
    
    func isInvalidToken( statusCode: Int?) -> Bool {
        return statusCode != ServerConstants.InvalidAccessToken
    }
    
    func isNotFound(_ statusCode: Int?) -> Bool {
        statusCode == ServerConstants.notFound
    }
}
