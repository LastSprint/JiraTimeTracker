//
//  UserDataKeychainStorageTests.swift
//  UnitTests
//

import Foundation
import XCTest

@testable
import JTrack

final class UserDataKeychainStorageDeleteTests: XCTestCase {

    func testDeleteEmptyItemsWontThrows() {
        // Arrange

        let storage = UserDataKeychainStorage()

        // Act

        let action = { try storage.clear() }

        // Assert

        XCTAssertNoThrow(try action(),
                         "We don't awaiting error thriwong if we try to clean empty storage")
        XCTAssertNoThrow(try action(),
                         "We don't awaiting error thriwong if we try to clean empty storage")
    }

    func testThatClearWork() {
        // Arrange

        let storage = UserDataKeychainStorage()

        // Act

        do {
            try storage.write(data: "testThatClearWork")
        } catch {
            XCTFail("Error \(error) occured while writing")
        }

        do {
            try storage.clear()
        } catch {
            XCTFail("Error \(error) occured while clearing")
        }

        // Assert

        XCTAssertThrowsError(try storage.read(),
                             "We should get error if we try read after storge was cleared") { err in
            guard case UserDataCryptoStoreError.cantFindDataInKeychain = err else {
                XCTFail("Method should throws .cantFindDataInKeychain but \(err) was thrown")
                return
            }
        }
    }
}

