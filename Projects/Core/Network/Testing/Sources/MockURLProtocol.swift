//
//  MockURLProtocol.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/16/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import Foundation

public class MockURLProtocol: URLProtocol {
    public static var completionHandler: ((URLRequest) ->(Data?, URLResponse?, Error?))?
    
    public override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    public override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    public override class func requestIsCacheEquivalent(_ a: URLRequest, to b: URLRequest) -> Bool {
        return false
    }
    
    public override func startLoading() {
        guard let completionHandler = MockURLProtocol.completionHandler else {
            client?.urlProtocol(self, didReceive: HTTPURLResponse(url: request.url!, statusCode: 404, httpVersion: "1.1", headerFields: [:])!, cacheStoragePolicy: .notAllowed)
            return
        }
        
        let (data, response, error) = completionHandler(request)
        
        if let response = response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        
        if let data = data {
            client?.urlProtocol(self, didLoad: data)
        }
        
        if let error = error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    public override func stopLoading() {
        
    }
}
