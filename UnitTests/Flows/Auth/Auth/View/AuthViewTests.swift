//
//  AuthViewTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class AuthViewTests: XCTestCase {

    // MARK: - Properties

    private var view: AuthViewController?
    private var output: AuthViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = AuthViewController()
        output = AuthViewOutputMock()
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

    final class AuthViewOutputMock: AuthViewOutput {
        var viewLoadedWasCalled: Bool = false

        func viewLoaded() {
            viewLoadedWasCalled = true
        }
    }

}
