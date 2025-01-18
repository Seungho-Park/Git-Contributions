//
//  NetworkService.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import Foundation
import CoreNetworkInterface

public class DefaultNetworkService: NetworkService {
    private let sessionManager: CoreNetworkInterface.NetworkSessionManager
    
    public init(sessionManager: CoreNetworkInterface.NetworkSessionManager = DefaultNetworkSessionManager()) {
        self.sessionManager = sessionManager
    }
    
    private func resolve(_ error: Error)-> NetworkError {
        let code = URLError.Code(rawValue: (error as NSError).code)
        switch code {
        case .notConnectedToInternet: return .connectionRefused
        case .cancelled: return .cancelled
        default: return .generic(error)
        }
    }
    
    public func request(
        with endpoint: CoreNetworkInterface.Requestable,
        completion: @escaping CompletionHandler
    )-> URLSessionTask? {
        do {
            let urlRequest = try endpoint.urlRequest()
            let task = sessionManager.request(urlRequest) { data, response, error in
                // TODO: Status Code 체크하는 부분 안넣었다. 테스트 코드 작성 후 하는걸로
                if let error = error {
                    completion(.failure(self.resolve(error)))
                    
                } else {
                    if let response = response as? HTTPURLResponse {
                        switch response.statusCode {
                        case 200...299: completion(.success(data))
                        case 401: completion(.failure(.unauthorized))
                        case 404: completion(.failure(.notFound))
                        default: completion(.failure(.error(statusCode: response.statusCode)))
                        }
                    } else {
                        completion(.failure(.noResponse))
                    }
                }
            }
            
            return task
        } catch {
            completion(.failure(.urlGeneration))
            return nil
        }
    }
    
    public func request(with endpoint: Requestable) async -> Result<Data?, NetworkError> {
        guard let urlRequest = try? endpoint.urlRequest() else {
            return .failure(.urlGeneration)
        }
        
        do {
            let (data, response) = try await sessionManager.request(urlRequest)
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200..<300: return .success(data)
                case 401: return .failure(NetworkError.unauthorized)
                case 404: return .failure(NetworkError.notFound)
                default: return .failure(.error(statusCode: response.statusCode))
                }
            } else {
                return .failure(.noResponse)
            }
        } catch {
            return .failure(resolve(error))
        }
    }
}
