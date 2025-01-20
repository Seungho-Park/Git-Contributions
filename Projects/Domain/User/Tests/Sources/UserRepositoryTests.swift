//
//  UserRepositoryTests.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import XCTest
import DomainUserInterface
import DomainUser
import DomainUserTesting
import CoreStorageInterface

final class UserRepositoryTests: XCTestCase {
    var repository: UserRepository!
    
    override func setUpWithError() throws {
        repository = UserRepositoryImpl(storage: MockCoreDataStorage())
    }
    
    override func tearDownWithError() throws {
        repository = nil
    }
    
    func test_WhenFetchSavedUser_ShouldReturnFiveUsers() {
        //given
        let saveExpectation = expectation(description: "test_WhenFetchSavedUser_ShouldReturnFiveUsers")
        let fetchExpectation = expectation(description: "test_WhenFetchSavedUser_ShouldReturnFiveUsers")
        
        let expectedUsers: [User] = [
            .init(id: 1, type: .github, userName: "first", name: "firstUser", url: "https://api.github.com1"),
            .init(id: 2, type: .github, userName: "second", name: "secondUser", url: "https://api.github.com2"),
            .init(id: 3, type: .github, userName: "third", name: "thirdUser", url: "https://api.github.com3"),
            .init(id: 4, type: .github, userName: "fourth", name: "fourthUser", url: "https://api.github.com4"),
            .init(id: 5, type: .github, userName: "fifth", name: "fifthUser", url: "https://api.github.com5")
        ]
        
        //when
        for i in 0..<expectedUsers.count {
            let expectation = expectation(description: "Save...")
            repository.save(expectedUsers[i]) { isSuccess in
                XCTAssertTrue(isSuccess)
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 1)
            
            if i == expectedUsers.count-1 {
                saveExpectation.fulfill()
            }
        }
        
        wait(for: [saveExpectation], timeout: 5)
        
        //then
        repository.fetchUserList { result in
            guard let userList = try? result.get() else {
                XCTFail("FetchUserError...")
                return
            }
            
            XCTAssertEqual(userList.count, expectedUsers.count)
            
            for i in 0..<expectedUsers.count {
                XCTAssertEqual(userList[i].id, expectedUsers[i].id)
                XCTAssertEqual(userList[i].name, expectedUsers[i].name)
                XCTAssertEqual(userList[i].userName, expectedUsers[i].userName)
                XCTAssertEqual(userList[i].url, expectedUsers[i].url)
                XCTAssertEqual(userList[i].type, expectedUsers[i].type)
            }
            
            fetchExpectation.fulfill()
        }
        
        wait(for: [fetchExpectation], timeout: 3)
    }
    
    func test_WhenConcurrencyFetchSavedUser_ShouldReturnFiveUsers() async {
        //given
        let expectedUsers: [User] = [
            .init(id: 1, type: .github, userName: "first", name: "firstUser", url: "https://api.github.com1"),
            .init(id: 2, type: .github, userName: "second", name: "secondUser", url: "https://api.github.com2"),
            .init(id: 3, type: .github, userName: "third", name: "thirdUser", url: "https://api.github.com3"),
            .init(id: 4, type: .github, userName: "fourth", name: "fourthUser", url: "https://api.github.com4"),
            .init(id: 5, type: .github, userName: "fifth", name: "fifthUser", url: "https://api.github.com5")
        ]
        
        //when
        for user in expectedUsers {
            await repository.save(user)
        }
        
        guard let userList = try? await repository.fetchUserList() else {
            XCTFail("Fetch UserList Failed...")
            return
        }
        
        //then
        XCTAssertEqual(userList.count, expectedUsers.count)
        
        for i in 0..<expectedUsers.count {
            XCTAssertEqual(userList[i].id, expectedUsers[i].id)
            XCTAssertEqual(userList[i].name, expectedUsers[i].name)
            XCTAssertEqual(userList[i].userName, expectedUsers[i].userName)
            XCTAssertEqual(userList[i].url, expectedUsers[i].url)
            XCTAssertEqual(userList[i].type, expectedUsers[i].type)
        }
    }
    
    func test_WhenSaveTwoSameUser_ShouldSaveOneUser() {
        //given
        let saveExpectation = expectation(description: "test_WhenFetchSavedUser_ShouldReturnFiveUsers")
        let fetchExpectation = expectation(description: "test_WhenFetchSavedUser_ShouldReturnFiveUsers")
        
        let expectedUsers: [User] = [
            .init(id: 1, type: .github, userName: "first", name: "firstUser", url: "https://api.github.com1"),
            .init(id: 1, type: .github, userName: "second", name: "secondUser", url: "https://api.github.com2")
        ]
        
        //when
        for i in 0..<expectedUsers.count {
            let expectation = expectation(description: "Save...")
            repository.save(expectedUsers[i]) { isSuccess in
                XCTAssertTrue(isSuccess)
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 1)
            
            if i == expectedUsers.count-1 {
                saveExpectation.fulfill()
            }
        }
        
        wait(for: [saveExpectation], timeout: 3)
        
        //then
        repository.fetchUserList { result in
            guard let userList = try? result.get() else {
                XCTFail("Fetch UserList Failed...")
                return
            }
            
            XCTAssertEqual(userList.count, 1)
            XCTAssertEqual(userList.first!.name, expectedUsers.last!.name)
            XCTAssertEqual(userList.first!.id, expectedUsers.last!.id)
            XCTAssertEqual(userList.first!.type, expectedUsers.last!.type)
            XCTAssertEqual(userList.first!.url, expectedUsers.last!.url)
            XCTAssertEqual(userList.first!.userName, expectedUsers.last!.userName)
            
            fetchExpectation.fulfill()
        }
        wait(for: [fetchExpectation], timeout: 3)
    }
    
    func test_WhenConcurrencySaveTwoSameUser_ShouldSaveOneUser() async {
        //given
        let expectedUsers: [User] = [
            .init(id: 1, type: .github, userName: "first", name: "firstUser", url: "https://api.github.com1"),
            .init(id: 1, type: .github, userName: "second", name: "secondUser", url: "https://api.github.com2")
        ]
        
        //when
        for user in expectedUsers {
            await repository.save(user)
        }
        
        guard let userList = try? await repository.fetchUserList() else {
            XCTFail("Fetch UserList Failed...")
            return
        }
        
        //then
        XCTAssertEqual(userList.count, 1)
        XCTAssertEqual(userList.first!.id, expectedUsers.last!.id)
        XCTAssertEqual(userList.first!.name, expectedUsers.last!.name)
        XCTAssertEqual(userList.first!.userName, expectedUsers.last!.userName)
        XCTAssertEqual(userList.first!.url, expectedUsers.last!.url)
        XCTAssertEqual(userList.first!.type, expectedUsers.last!.type)
    }
    
    func test_WhenConcurrencySaveUser_ShouldSaveUserInCoreData() async {
        //given
        let user = User(id: 1, type: .github, userName: "TestUser", name: "Test", url: "https://api.github.com")
        
        //when
        let isSuccess = await repository.save(user)
        guard let savedUser = try? await repository.fetchUserList() else {
            XCTFail("Fetch User List Failed...")
            return
        }
        
        //then
        XCTAssertEqual(isSuccess, true)
        XCTAssertEqual(savedUser.count, 1)
        XCTAssertEqual(savedUser[0].id, user.id)
        XCTAssertEqual(savedUser[0].name, user.name)
        XCTAssertEqual(savedUser[0].userName, user.userName)
        XCTAssertEqual(savedUser[0].url, user.url)
        XCTAssertEqual(savedUser[0].type, user.type)
    }
    
    func test_WhenSaveUser_ShouldSaveUserInCoreData() {
        //given
        let saveExpectation = expectation(description: "test_WhenSaveUser_ShouldSaveUserInCoreData")
        let fetchExpectation = expectation(description: "test_WhenSaveUser_ShouldSaveUserInCoreData")
        let user = User(id: 1, type: .github, userName: "TestUser", name: "Test", url: "https://api.github.com")
        
        //when
        repository.save(user) { isSuccess in
            XCTAssertEqual(isSuccess, true)
            
            saveExpectation.fulfill()
        }
        
        wait(for: [saveExpectation], timeout: 3)
        
        //then
        self.repository.fetchUserList { result in
            guard let savedUser = try? result.get() else {
                XCTFail("Fetch User List Failed...")
                return
            }
            
            XCTAssertEqual(savedUser.count, 1)
            XCTAssertEqual(savedUser[0].id, user.id)
            XCTAssertEqual(savedUser[0].name, user.name)
            XCTAssertEqual(savedUser[0].userName, user.userName)
            XCTAssertEqual(savedUser[0].url, user.url)
            XCTAssertEqual(savedUser[0].type, user.type)
            
            fetchExpectation.fulfill()
        }
        
        wait(for: [fetchExpectation], timeout: 3)
    }
}
