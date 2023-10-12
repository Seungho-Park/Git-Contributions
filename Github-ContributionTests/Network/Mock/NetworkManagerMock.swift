//
//  NetworkManagerMock.swift
//  Github-ContributionTests
//
//  Created by 박승호 on 10/12/23.
//

import Foundation

struct NetworkManagerMock: NetworkManager {
    let data: Data?
    let response: HTTPURLResponse?
    let error: Error?

    func request(_ request: URLRequest, completion: @escaping Completion) -> URLSessionTask {
        completion(data, response, error)
        return URLSessionDataTask()
    }
}
