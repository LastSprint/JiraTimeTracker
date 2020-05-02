//
//  TabBarModuleConfiguratorTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class TabBarModuleConfiguratorTests: XCTestCase {

    // MARK: - Tests

    func testDeallocation() {
        assertDeallocation(of: {
            let (view, input) = TabBarModuleConfigurator().configure()
            return (view, [input])
        })
    }
}
