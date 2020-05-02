//
//  ProjectsModuleConfiguratorTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class ProjectsModuleConfiguratorTests: XCTestCase {

    // MARK: - Tests

    func testDeallocation() {
        assertDeallocation(of: {
            let (view, input) = ProjectsModuleConfigurator().configure()
            return (view, [input])
        })
    }
}
