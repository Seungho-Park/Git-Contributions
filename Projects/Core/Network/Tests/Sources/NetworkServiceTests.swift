//
//  NetworkServiceTests.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import XCTest
import CoreNetwork
import CoreNetworkInterface
import CoreNetworkTesting

final class NetworkServiceTests: XCTestCase {
    let networkService = NetworkService(sessionManager: MockSessionManager())
    
    func test_WhenRequestFetchJSONMockObject_ShouldReturnMockObject() {
        //given
        var callCount = 0
        let expectation = XCTestExpectation(description: "test_WhenRequestFetchJSONMockObject_ShouldReturnMockObject")
        let expectedResponse = "Test Data".data(using: .utf8)
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return (expectedResponse, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        _ = networkService.request(with: endpoint) { result in
            guard let data = try? result.get() else {
                XCTFail("Error Occurred...")
                return
            }
            
            XCTAssertEqual(data, expectedResponse)
            callCount += 1
            expectation.fulfill()
        }
        
        //then
        self.wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
    
    func testWhenConcurrencyRequestFetchJSONObject_ShouldReturnMockObject() {
        //given
        var callCount = 0
        let expectation = XCTestExpectation(description: "testWhenConcurrencyRequestFetchJSONObject_ShouldReturnMockObject")
        let expectedResponse = "Test Data".data(using: .utf8)
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return (expectedResponse, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        let response = networkService.request(with: endpoint)
        
        Task {
            guard let data = try? await response.value else {
                XCTFail("Error Occurred...")
                return
            }
            
            callCount += 1
            XCTAssertEqual(data, expectedResponse)
            expectation.fulfill()
        }
        
        
        //then
        self.wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
    
    func test_WhenRequestFetchData_ShouldReturnUnauthorizedError() {
        //given
        let expectation = XCTestExpectation(description: "test_WhenRequestFetchData_ShouldReturnUnauthorizedError")
        var callCount = 0
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return (nil, HTTPURLResponse(url: url, statusCode: 401, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        _ = networkService.request(with: endpoint, completion: { result in
            do {
                _ = try result.get()
                XCTFail("Should return success")
            } catch {
                guard case NetworkError.unauthorized = error else {
                    XCTFail("NetworkError should be unauthorized")
                    return
                }
                
                callCount += 1
                expectation.fulfill()
            }
        })
        
        //then
        self.wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
    
    func test_WhenConcurrencyRequestFetchData_ShouldReturnUnauthorizedError() {
        //given
        let expectation = XCTestExpectation(description: "test_WhenConcurrencyRequestFetchData_ShouldReturnUnauthorizedError")
        var callCount = 0
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return ("dd".data(using: .utf8), HTTPURLResponse(url: url, statusCode: 401, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        let response = networkService.request(with: endpoint)
        
        Task {
            do {
                _ = try await response.value
                XCTFail("Should return success")
            } catch {
                guard case NetworkError.unauthorized = error else {
                    XCTFail("Should return unauthorized error")
                    return
                }
                
                callCount += 1
                expectation.fulfill()
            }
        }
        
        //then
        self.wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
}
