//
//  DataTransferService.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import Foundation
import CoreNetworkInterface

public class DefaultDataTransferService: DataTransferService {
    private let service: CoreNetworkInterface.NetworkService
    
    public init(service: CoreNetworkInterface.NetworkService) {
        self.service = service
    }
    
    public func request<E: ResponseRequestable, T: Decodable>(with endpoint: E, completion: @escaping (Result<T, DataTransferError>)-> Void)-> URLSessionTask? where E.Response == T {
        service.request(with: endpoint) { result in
            switch result {
            case .success(let data):
                let decode: Result<T, DataTransferError> = self.decode(data, decoder: endpoint.responseDecoder)
                completion(decode)
            case .failure(let error):
                completion(.failure(.networkError(error)))
            }
        }
    }
    
    public func request<E: ResponseRequestable>(with endpoint: E, completion: @escaping (Result<Void, DataTransferError>)-> Void)-> URLSessionTask? where E.Response == Void {
        service.request(with: endpoint) { result in
            switch result {
            case .success: completion(.success(()))
            case .failure(let error): completion(.failure(.networkError(error)))
            }
        }
    }
    
    public func request<E: ResponseRequestable, T: Decodable>(with endpoint: E) -> Task<T, Error> where E.Response == T  {
        return Task<T, Error> {
            let result = await service.request(with: endpoint)
            
            switch result {
            case .success(let data):
                let decode: Result<T, DataTransferError> = decode(data, decoder: endpoint.responseDecoder)
                switch decode {
                case .success(let dto): return dto
                case .failure(let error): throw error
                }
            case .failure(let error):
                throw DataTransferError.networkError(error)
            }
        }
    }
    
    public func request<E: ResponseRequestable>(with endpoint: E)-> Task<Void, Error> where E.Response == Void {
        return Task<Void, Error> {
            let result = await service.request(with: endpoint)
            
            switch result {
            case .success: return ()
            case .failure(let error): throw DataTransferError.networkError(error)
            }
        }
    }
    
    private func decode<T: Decodable>(_ data: Data?, decoder: ResponseDecoder)-> Result<T, DataTransferError> {
        do {
            guard let data, !data.isEmpty else {
                return .failure(.networkError(.noResponse))
            }
            
            let decode: T = try decoder.decode(data)
            return .success(decode)
        } catch {
            return .failure(.parsing(error))
        }
    }
}
