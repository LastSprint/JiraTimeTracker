//
//  IssuesViewTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class IssuesViewTests: XCTestCase {

    // MARK: - Properties

    private var view: IssuesViewController?
    private var output: IssuesViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = IssuesViewController()
        output = IssuesViewOutputMock()
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

    final class IssuesViewOutputMock: IssuesViewOutput {
        var viewLoadedWasCalled: Bool = false

        func viewLoaded() {
            viewLoadedWasCalled = true
        }
    }

}
