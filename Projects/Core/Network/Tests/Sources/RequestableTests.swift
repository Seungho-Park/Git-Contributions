//
//  RequestableTests.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import XCTest
import CoreNetwork
import CoreNetworkInterface

final class RequestableTests: XCTestCase {
    struct MockRequestDTO: Encodable {
        let name: String
        let version: Double
    }
    
    func test_WhenGenerateURL_ShouldReturnURL() {
        //given
        let request = EndPoint<Void>(path: "http://mock.test.com/api/v1/test")
        
        //when
        guard let sut = try? request.urlRequest() else {
            XCTFail("UrlRequest Generate Failed")
            return
        }
        
        //then
        XCTAssertEqual(sut.url?.relativeString, "http://mock.test.com/api/v1/test")
    }
    
    func test_WhenGenerateURLWithURLParameters_ShouldReturnURL() {
        //given
        let request = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get, urlParameters: ["name":"Swift"])
        
        //when
        guard let sut = try? request.urlRequest() else {
            XCTFail("UrlRequest Generate Failed")
            return
        }
        
        //then
        XCTAssertEqual(sut.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(sut.url?.relativeString, "https://api.mock.com/v1/test?name=Swift")
    }
    
    func test_WhenGenerateURLWithBodyEncodable_ShouldGetRequestBody() {
        //given
        let expectedBody = MockRequestDTO(name: "Swift", version: 6.0)
        let request = EndPoint<Void>(path: "https://api.mock.com/v1/test", httpMethod: .get, httpBody: expectedBody)
        
        //when
        guard let sut = try? request.urlRequest() else {
            XCTFail("UrlRequest Generate Failed")
            return
        }
        
        //then
        XCTAssertNotNil(sut.httpBody)
        let bodyParams = try? JSONSerialization.jsonObject(with: sut.httpBody!) as? [String: Any]
        XCTAssertNotNil(bodyParams)
        XCTAssertEqual(bodyParams!["name"] as? String, "Swift")
        XCTAssertEqual(bodyParams!["version"] as? Double, 6.0)
    }
    
    func test_WhenGenerateInvalidURL_ShouldReturnComponentsError() {
        //given
        var callCount = 0
        let request = EndPoint<Void>(path: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~:/?#[]@!$&'()*+,;=", httpMethod: .get)
        
        //when
        do {
            _ = try request.urlRequest()
            XCTFail("Should Return InvalidUrlError")
        } catch {
            if case RequestGenerationError.components = error {
                callCount += 1
            } else {
                XCTFail("Invalid Error Type.")
            }
        }
        
        //then
        XCTAssertEqual(callCount, 1)
    }
}
