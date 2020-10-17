//
//  FavoritesListModuleConfiguratorTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class FavoritesListModuleConfiguratorTests: XCTestCase {

    // MARK: - Tests

    func testDeallocation() {
        assertDeallocation(of: {
            let (view, input) = FavoritesListModuleConfigurator().configure()
            return (view, [input])
        })
    }

}