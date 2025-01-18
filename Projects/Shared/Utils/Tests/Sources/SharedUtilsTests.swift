//
//  SharedUtilsTests.swift
//  SharedUtils
//
//  Created by 박승호 on 1/18/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import XCTest
import SharedUtilsInterface

final class SharedUtilsTests: XCTestCase {
    func test_WhenDictionaryToUrlParameters_ShouldReturnCorrectParameterString() {
        //given
        let expectedValue = ["first=value", "second=1"]
        let dictionary: [String: Any] = ["first":"value", "second": 1]
        
        //when
        let parameterString = dictionary.urlParameters.split(separator: "&").sorted().map { String($0) }
        
        //then
        XCTAssertEqual(expectedValue, parameterString)
    }
    
    func test_WhenEncodableObjectToQueryParameters_ShouldReturnCorrectDictionary() {
        struct MockEncodable: Encodable {
            let name: String
            let age: Int
        }
        
        //given
        let expectedValue: [String: Any] = ["name": "Tester", "age": 30]
        let mock = MockEncodable(name: "Tester", age: 30)
        
        //when
        let parameterDict = mock.queryParameters
        
        //then
        XCTAssertEqual(expectedValue.count, parameterDict.count)
        XCTAssertEqual(expectedValue["name"] as! String, parameterDict["name"] as! String)
        XCTAssertEqual(expectedValue["age"] as! Int, parameterDict["age"] as! Int)
    }
}
