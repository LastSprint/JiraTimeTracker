//
//  UserDataKeychainStorageEncryptTests.swift
//  UnitTests
//

import Foundation
import XCTest

@testable
import JTrack

final class UserDataKeychainStorageReadWrite: XCTestCase {

    /// Check that `write(data:)` method won't throws when we write something
    func testWriteDontThrow() {
        // Arrange

        let dataToWrite = "Test Data"
        let storage = UserDataKeychainStorage()

        // Act

        let action = { try storage.write(data: dataToWrite) }

        // Assert

        XCTAssertNoThrow(try action(), "Exception wasn't awaiting in simple write operation")
    }

    func testOverwritingWork() {
        // Arrange

        let dataToWrite = "Test Data"
        let storage = UserDataKeychainStorage()

        // Act

        let action = { try storage.write(data: dataToWrite) }

        // Assert

        XCTAssertNoThrow(try action(), "Exception wasn't awaiting in simple write operation")
        XCTAssertNoThrow(try action(), "Exception wasn't awaiting in simple write operation")
    }

    func testCanReadWhatWeWrite() {

        // Arrange

        let dataToWrite = "testCanReadWhatWeWrite"
        let storage = UserDataKeychainStorage()

        // Act

        do {
            try storage.write(data: dataToWrite)
        } catch {
            XCTFail("Write operation failed: \(error)")
            return
        }

        var readed = ""

        do {
            readed = try storage.read()
        } catch {
            XCTFail("Read operation failed: \(error)")
            return
        }

        // Assert

        XCTAssertEqual(dataToWrite, readed, "Readed data: \(readed) isn't equal to had written \(dataToWrite)")
    }
}
