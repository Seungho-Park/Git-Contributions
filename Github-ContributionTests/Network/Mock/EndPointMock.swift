//
//  EndPointMock.swift
//  Github-ContributionTests
//
//  Created by 박승호 on 10/12/23.
//

import Foundation

struct EndPointMock: Requestable {
    var url: String
    var path: String
    var httpMethod: HttpMethodType
    var header: [String : String]
    var queryEncodable: Encodable?
    var queryParameters: [String : Any]
    var bodyEncodable: Encodable?
    
    init(url: String, path: String, httpMethod: HttpMethodType = .get, header: [String : String] = [:], queryEncodable: Encodable? = nil, queryParameters: [String : Any] = [:], bodyEncodable: Encodable? = nil) {
        self.url = url
        self.path = path
        self.httpMethod = httpMethod
        self.header = header
        self.queryEncodable = queryEncodable
        self.queryParameters = queryParameters
        self.bodyEncodable = bodyEncodable
    }
}
