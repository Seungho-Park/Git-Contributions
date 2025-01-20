//
//  FetchUserListUsecaseTests.swift
//  DomainUser
//
//  Created by 박승호 on 1/21/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import XCTest
import DomainUser
import DomainUserInterface
import DomainUserTesting
import SharedThirdPartyLibs

final class FetchUserListUsecaseTests: XCTestCase {
    var disposeBag: DisposeBag!
    let storedUserList: [User] = [
        .init(id: 1, type: .github, userName: "github1", name: "githubUser1", url: "https://api.github.com"),
        .init(id: 2, type: .github, userName: "github2", name: "githubUser2", url: "https://api.github.com"),
        .init(id: 3, type: .github, userName: "github3", name: "githubUser3", url: "https://api.github.com"),
        .init(id: 4, type: .github, userName: "github4", name: "githubUser4", url: "https://api.github.com"),
        .init(id: 5, type: .github, userName: "github5", name: "githubUser5", url: "https://api.github.com")
    ]
    var sut: FetchUserListUseCase!
    
    override func setUp() async throws {
        disposeBag = DisposeBag()
        let repository = UserRepositoryImpl(storage: MockCoreDataStorage())
        for user in storedUserList {
            await repository.save(user)
        }
        
        sut = FetchUserListUseCaseImpl(userRepository: repository)
    }
    
    override func tearDown() async throws {
        disposeBag = nil
        sut = nil
    }
    
    func testFetchUserUsecase_WhenSuccessFetchUserList_ShouldReturnUserList() {
        //given
        let expectation = expectation(description: "testFetchUserUsecase_WhenSuccessFetchUserList_ShouldReturnUserList")
        var callCount = 0
        
        //when
        sut.execute()
            .subscribe { [unowned self] result in
                guard let userList = try? result.get() else {
                    XCTFail("FetchUserList Failed...")
                    return
                }
                
                XCTAssertEqual(userList.count, storedUserList.count)
                for i in 0..<storedUserList.count {
                    XCTAssertEqual(storedUserList[i].id, userList[i].id)
                    XCTAssertEqual(storedUserList[i].type, userList[i].type)
                    XCTAssertEqual(storedUserList[i].name, userList[i].name)
                    XCTAssertEqual(storedUserList[i].userName, userList[i].userName)
                    XCTAssertEqual(storedUserList[i].url, userList[i].url)
                }
                
                callCount += 1
                expectation.fulfill()
            }
            .disposed(by: disposeBag)
        
        //then
        wait(for: [expectation], timeout: 3)
        XCTAssertEqual(callCount, 1)
    }
}
