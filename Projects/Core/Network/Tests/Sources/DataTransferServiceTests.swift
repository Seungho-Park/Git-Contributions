//
//  DataTransferServiceTests.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/18/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import XCTest
import CoreNetwork
import CoreNetworkTesting
import CoreNetworkInterface

final class DataTransferServiceTests: XCTestCase {
    var dataTransferService: CoreNetworkInterface.DataTransferService!
    
    override func setUpWithError() throws {
        let service = NetworkService(sessionManager: MockSessionManager())
        dataTransferService = DataTransferService(service: service)
    }
    
    override func tearDownWithError() throws {
        dataTransferService = nil
        MockURLProtocol.completionHandler = nil
    }
    
    func test_WhenRequestIsSuccess_ShouldReturnValidDecodableObject() {
        //given
        var callCount = 0
        let expectation = XCTestExpectation(description: "test_WhenRequestIsSuccess_ShouldReturnValidDecodableObject")
        let expectedResponse = "{\"name\":\"Swift\"}".data(using: .utf8)
        let endpoint = EndPoint<MockResponseDTO>(path: "https://api.mock.com/v1/test")
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.notFound)
            }
            
            return (expectedResponse, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        _ = dataTransferService.request(with: endpoint) { result in
            guard let dto = try? result.get() else {
                XCTFail("Failed DataTransfer Request...")
                return
            }
            
            XCTAssertEqual(dto.name, "Swift")
            callCount += 1
            expectation.fulfill()
        }
        
        //then
        wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
    
    func test_WhenConcurrencyRequestIsSuccess_ShouldReturnValidDecodableObject() {
        //given
        var callCount = 0
        let expectation = XCTestExpectation(description: "test_WhenConcurrencyRequestIsSuccess_ShouldReturnValidDecodableObject")
        let expectedResponse = "{\"name\":\"Swift\"}".data(using: .utf8)
        let endpoint = EndPoint<MockResponseDTO>(path: "https://api.mock.com/v1/test")
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.notFound)
            }
            
            return (expectedResponse, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        let task = dataTransferService.request(with: endpoint)
        Task {
            guard let dto = try? await task.value else {
                XCTFail("Failed DataTransfer Request...")
                return
            }
            
            XCTAssertEqual(dto.name, "Swift")
            callCount += 1
            expectation.fulfill()
        }
        
        //then
        wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
    
    func test_WhenRequestDataTransferSerivce_ShouldReturnParsingError() {
        //given
        var callCount = 0
        let expectation = XCTestExpectation(description: "test_WhenRequestDataTransferSerivce_ShouldReturnParsingError")
        let expectedResponse = "{\"name2\":\"Swift\"}".data(using: .utf8)
        let endpoint = EndPoint<MockResponseDTO>(path: "https://api.mock.com/v1/test")
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.notFound)
            }
            
            return (expectedResponse, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        _ = dataTransferService.request(with: endpoint) { result in
            do {
                _ = try result.get()
                XCTFail("Should not happen...")
            } catch {
                guard case DataTransferError.parsing = error else {
                    XCTFail("Should return parsing error")
                    return
                }
            }
            
            callCount += 1
            expectation.fulfill()
        }
        
        //then
        wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
    
    func test_WhenConcurrencyRequestDataTransferSerivce_ShouldReturnParsingError() {
        //given
        var callCount = 0
        let expectation = XCTestExpectation(description: "test_WhenConcurrencyRequestDataTransferSerivce_ShouldReturnParsingError")
        let endpoint = EndPoint<MockResponseDTO>(path: "https://api.mock.com/v1/test")
        let expectedResponse = "{\"name2\":\"Swift\"}".data(using: .utf8)
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.notFound)
            }
            
            return (expectedResponse, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        let task = dataTransferService.request(with: endpoint)
        Task {
            do {
                _ = try await task.value
                XCTFail("Should not happen...")
            } catch {
                guard case DataTransferError.parsing = error else {
                    XCTFail("Should return parsing error")
                    return
                }
            }
            
            callCount += 1
            expectation.fulfill()
        }
        
        //then
        wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
    
    func test_WhenRequestDataTransferSerivce_ShouldReturnNetworkError() {
        //given
        var callCount = 0
        let expectation = XCTestExpectation(description: "test_WhenRequestDataTransferSerivce_ShouldReturnNetworkError")
        let endpoint = EndPoint<MockResponseDTO>(path: "https://api.mock.com/v1/test")
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.notFound)
            }
            
            return (nil, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        _ = dataTransferService.request(with: endpoint) { result in
            do {
                _ = try result.get()
                XCTFail("Should not happen...")
            } catch {
                guard case DataTransferError.networkError = error else {
                    XCTFail("Should return networkError error")
                    return
                }
            }
            
            callCount += 1
            expectation.fulfill()
        }
        
        //then
        wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
    
    func test_WhenConcurrencyRequestDataTransferSerivce_ShouldReturnNetworkError() {
        //given
        var callCount = 0
        let expectation = XCTestExpectation(description: "test_WhenConcurrencyRequestDataTransferSerivce_ShouldReturnNetworkError")
        let endpoint = EndPoint<MockResponseDTO>(path: "https://api.mock.com/v1/test")
        MockURLProtocol.completionHandler = { request in
            guard let url = request.url else {
                return (nil, nil, NetworkError.notFound)
            }
            
            return (nil, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]), nil)
        }
        
        //when
        let task = dataTransferService.request(with: endpoint)
        Task {
            do {
                _ = try await task.value
                XCTFail("Should not happen...")
            } catch {
                guard case DataTransferError.networkError = error else {
                    XCTFail("Should return networkError error")
                    return
                }
            }
            
            callCount += 1
            expectation.fulfill()
        }
        
        //then
        wait(for: [expectation], timeout: 2)
        XCTAssertEqual(callCount, 1)
    }
}
