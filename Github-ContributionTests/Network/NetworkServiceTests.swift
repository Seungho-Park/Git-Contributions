//
//  NetworkServiceTests.swift
//  Github-ContributionTests
//
//  Created by 박승호 on 10/12/23.
//

import XCTest

class NetworkServiceTests: XCTestCase {
    func test_DataRequest() {
        let expectedResponse = "Response".data(using: .utf8)
        var completionCount = 0
        let sut = NetworkService(networkManager: NetworkManagerMock(data: expectedResponse, response: nil, error: nil))
        
        _ = sut.request(with: EndPointMock(url: "https://example.com", path: ""), completion: { result in
            guard let responseData = try? result.get() else {
                XCTFail("Failure")
                return
            }
            XCTAssertEqual(responseData, expectedResponse)
            completionCount += 1
        })
        
        XCTAssertEqual(completionCount, 1)
    }
}
