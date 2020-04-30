//
//  AuthModuleConfiguratorTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class AuthModuleConfiguratorTests: XCTestCase {

    // MARK: - Tests

    func testDeallocation() {
        assertDeallocation(of: {
            let (view, input) = AuthModuleConfigurator().configure()
            return (view, [input])
        })
    }

}