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
}
