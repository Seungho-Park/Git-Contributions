//
//  EndPoint.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/11/23.
//

import Foundation
//Github(api) -> https://api.github.com/users/:Username
//Github(Contributions) -> https://github.com/users/:Username/contributions
//Gitlab(contributions, api) -> https://example.gitlab.com/api/v4/ ~~
//둘이 설정도 다르고 특히 github는 요청 주소까지 달라지는데 설계를 어떻게 가야 깔끔하지?

protocol RequestResponsible: Requestable {
    associatedtype Response
    
    var responseDecoder: ResponseDecoder { get }
}

class EndPoint<E>: RequestResponsible {
    typealias Response = E
    
    let url: String
    let path: String
    let httpMethod: HttpMethodType
    let header: [String : String]
    let queryEncodable: Encodable?
    let queryParameters: [String : Any]
    let bodyEncodable: Encodable?
    let responseDecoder: ResponseDecoder
    
    init(
        url: String,
        path: String,
        httpMethod: HttpMethodType = .get,
        header: [String : String] = [:],
        queryEncodable: Encodable? = nil,
        queryParameters: [String : Any] = [:],
        bodyEncodable: Encodable? = nil,
        responseDecoder: ResponseDecoder = JSONResponseDecoder()) {
            self.url = url
            self.path = path
            self.httpMethod = httpMethod
            self.header = header
            self.queryEncodable = queryEncodable
            self.queryParameters = queryParameters
            self.bodyEncodable = bodyEncodable
            self.responseDecoder = responseDecoder
    }
}

