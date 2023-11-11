//
//  Requestable.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/12/23.
//

import Foundation

protocol Requestable {
    var url: String { get }
    var path: String { get }
    var httpMethod: HttpMethodType { get }
    var header: [String:String] { get }
    var queryEncodable: Encodable? { get }
    var queryParameters: [String:Any] { get }
    var bodyEncodable: Encodable? { get }
    
    func urlRequest() throws -> URLRequest
}

extension Requestable {
    private func component() throws -> URL {
        let baseURL = url.last != "/" ? "\(url)/" : url
        let endPoint = baseURL+path
        
        guard var urlComponent = URLComponents(string: endPoint) else {
            throw NetworkError.component
        }
        
        var queryItems: [URLQueryItem] = []
        if let query = queryEncodable {
            try query.toDictionary().forEach {
                queryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
            }
        }
        
        self.queryParameters.forEach {
            queryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
        }
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            throw NetworkError.component
        }
        
        return url
    }
    
    func urlRequest() throws -> URLRequest {
        var request = URLRequest(url: try component())
        
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = header
        
        if let body = bodyEncodable {
            let data = try JSONSerialization.data(withJSONObject: body)
            request.httpBody = data
        }
        
        return request
    }
}

private extension Encodable {
    func toDictionary() throws -> [String:Any] {
        let data = try JSONEncoder().encode(self)
        guard let dict = try JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            throw NetworkError.component
        }
        
        return dict
    }
}

