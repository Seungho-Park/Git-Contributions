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
@preconcurrency import CoreNetworkTesting

final class NetworkServiceTests: XCTestCase {
    var networkService: CoreNetworkInterface.NetworkService!
    
    override func setUpWithError() throws {
        networkService = NetworkService(sessionManager: MockSessionManager())
    }
    
    override func tearDownWithError() throws {
        MockURLProtocol.completionHandler = nil
        networkService = nil
    }
    
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
    
    func testWhenConcurrencyRequestFetchJSONObject_ShouldReturnMockObject() async {
        //given
        let expectedResponse = "Test Data".data(using: .utf8)
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return (expectedResponse, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        let response = await networkService.request(with: endpoint)
        
        //then
        guard let data = try? response.get() else {
            XCTFail("Error Occurred...")
            return
        }
        
        XCTAssertEqual(data, expectedResponse)
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
                XCTFail("Should not happen...")
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
    
    func test_WhenConcurrencyRequestFetchData_ShouldReturnUnauthorizedError() async {
        //given
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return (nil, HTTPURLResponse(url: url, statusCode: 401, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        let response = await networkService.request(with: endpoint)
        
        //then
        do {
            _ = try response.get()
            XCTFail("Should not happen...")
        } catch {
            guard case NetworkError.unauthorized = error else {
                XCTFail("Should return unauthorized error")
                return
            }
        }
    }
    
    func test_WhenRequestFetchData_ShouldReturnNotFoundError() {
        //given
        let expectation = XCTestExpectation(description: "test_WhenRequestFetchData_ShouldReturnUnauthorizedError")
        var callCount = 0
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return (nil, HTTPURLResponse(url: url, statusCode: 404, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        _ = networkService.request(with: endpoint, completion: { result in
            do {
                _ = try result.get()
                XCTFail("Should not happen...")
            } catch {
                guard case NetworkError.notFound = error else {
                    XCTFail("NetworkError should be notFound")
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
    
    func test_WhenConcurrencyRequestFetchData_ShouldReturnNotFoundError() async {
        //given
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return (nil, HTTPURLResponse(url: url, statusCode: 404, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        let response = await networkService.request(with: endpoint)
        
        //then
        do {
            _ = try response.get()
            XCTFail("Should not happen...")
        } catch {
            guard case NetworkError.notFound = error else {
                XCTFail("Should return notFound error")
                return
            }
        }
    }
    
    func test_WhenRequestFetchData_ShouldReturnStatusCodeError() {
        //given
        let expectation = XCTestExpectation(description: "test_WhenRequestFetchData_ShouldReturnUnauthorizedError")
        var callCount = 0
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return (nil, HTTPURLResponse(url: url, statusCode: 403, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        _ = networkService.request(with: endpoint, completion: { result in
            do {
                _ = try result.get()
                XCTFail("Should not happen...")
            } catch {
                guard case NetworkError.error = error else {
                    XCTFail("NetworkError should be error(statusCode:)")
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
    
    func test_WhenConcurrencyRequestFetchData_ShouldReturnStatusCodeError() async {
        //given
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.urlGeneration)
            }
            return (nil, HTTPURLResponse(url: url, statusCode: 403, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        let response = await networkService.request(with: endpoint)
        
        //then
        do {
            _ = try response.get()
            XCTFail("Should not happen...")
        } catch {
            guard case NetworkError.error = error else {
                
                XCTFail("Should return error(statusCode:)")
                return
            }
        }
    }
    
    func test_WhenRequestFetchData_ShouldReturnConnectionRefusedError() {
        //given
        let expectation = XCTestExpectation(description: "test_WhenRequestFetchData_ShouldReturnUnauthorizedError")
        var callCount = 0
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            return (nil, nil, URLError(.notConnectedToInternet))
        }
        
        //when
        _ = networkService.request(with: endpoint, completion: { result in
            do {
                _ = try result.get()
                XCTFail("Should not happen...")
            } catch {
                guard case NetworkError.connectionRefused = error else {
                    XCTFail("NetworkError should be connectionRefused")
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
    
    func test_WhenConcurrencyRequestFetchData_ShouldReturnConnectionRefusedError() async {
        //given
        let endpoint = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get)
        
        MockURLProtocol.completionHandler = { request in
            return (nil, nil, URLError(.notConnectedToInternet))
        }
        
        //when
        let response = await networkService.request(with: endpoint)
        
        //then
        do {
            _ = try response.get()
            XCTFail("Should not happen...")
        } catch {
            guard case NetworkError.connectionRefused = error else {
                
                XCTFail("Should return connectionRefused")
                return
            }
        }
    }
}
