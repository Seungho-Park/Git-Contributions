//
//  DataTransferService.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/12/23.
//

import Foundation

protocol DataTransferService {
    typealias Completion<T> = (Result<T, DataTransferError>)-> Void
    
    @discardableResult
    func request<T: Decodable, E:RequestResponsible>(with endpoint:E, completion: @escaping Completion<T>)-> URLSessionTask? where E.Response == T
    
    @discardableResult
    func request<E: RequestResponsible>(with endpoint: E, completion: @escaping Completion<Void>)-> URLSessionTask? where E.Response == Void
}


class DataTransferServiceImpl: DataTransferService {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func request<T: Decodable, E: RequestResponsible>(with endpoint: E, completion: @escaping Completion<T>) -> URLSessionTask? where E.Response == T {
        networkService.request(with: endpoint) { result in
            switch result {
            case .success(let data):
                completion(self.decode(data: data, decoder: endpoint.responseDecoder))
            case .failure(let error):
                completion(.failure(.networkFailure(error)))
            }
        }
    }
    
    func request<E>(with endpoint: E, completion: @escaping Completion<Void>) -> URLSessionTask? where E : RequestResponsible, E.Response == () {
        networkService.request(with: endpoint) { result in
            switch result {
            case .success: completion(.success(()))
            case .failure(let error): completion(.failure(.networkFailure(error)))
            }
        }
    }
    
    private func decode<T: Decodable>(data: Data?, decoder: ResponseDecoder)-> Result<T, DataTransferError> {
        do {
            guard let data = data else {
                return .failure(.noResponse)
            }
            
            let result: T = try decoder.decode(data: data)
            return .success(result)
        } catch {
            return .failure(.parse(error))
        }
    }
}
