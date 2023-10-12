//
//  NetworkService.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/11/23.
//

import Foundation

protocol NetworkManager {
    typealias Completion = (Data?, URLResponse?, Error?)-> Void
    
    func request(_ request: URLRequest, completion: @escaping Completion)-> URLSessionTask
}

private class DefaultNetworkManager: NetworkManager {
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request(_ request: URLRequest, completion: @escaping Completion) -> URLSessionTask {
        let task = session.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }
}

class NetworkService {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = DefaultNetworkManager()) {
        self.networkManager = networkManager
    }
    
    func request(with endpoint: Requestable, completion: @escaping (Result<Data?, NetworkError>)-> Void)-> URLSessionTask? {
        do {
            let request = try endpoint.urlRequest()
            let task = networkManager.request(request) { data, response, error in
                if let error = error {
                    if let response = response as? HTTPURLResponse {
                        completion(.failure(.status(code: response.statusCode)))
                    } else {
                        completion(.failure(NetworkError.connectionRefused))
                    }
                    
                    Log.e("\(Self.self)", message: error.localizedDescription)
                } else {
                    completion(.success(data))
                }
            }
            return task
        } catch {
            completion(.failure(.component))
        }
        
        return nil
    }
}
