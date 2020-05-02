//
//  IssuesModuleConfiguratorTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class IssuesModuleConfiguratorTests: XCTestCase {

    // MARK: - Tests

    func testDeallocation() {
        assertDeallocation(of: {
            let (view, input) = IssuesModuleConfigurator().configure()
            return (view, [input])
        })
    }
}
