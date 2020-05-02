//
//  TabBarViewTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class TabBarViewTests: XCTestCase {

    // MARK: - Properties

    private var view: TabBarViewController?
    private var output: TabBarViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = TabBarViewController()
        output = TabBarViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    func testThatViewNotifiesPresenterOnDidLoad() {
        // when
        self.view?.viewDidLoad()
        // then
        XCTAssert(self.output?.viewLoadedWasCalled == true)
    }

    // MARK: - Mocks

    final class TabBarViewOutputMock: TabBarViewOutput {
        var viewLoadedWasCalled: Bool = false

        func viewLoaded() {
            viewLoadedWasCalled = true
        }
    }

}
