//
//  ProjectsViewTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class ProjectsViewTests: XCTestCase {

    // MARK: - Properties

    private var view: ProjectsViewController?
    private var output: ProjectsViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = ProjectsViewController()
        output = ProjectsViewOutputMock()
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

    final class ProjectsViewOutputMock: ProjectsViewOutput {
        var viewLoadedWasCalled: Bool = false

        func viewLoaded() {
            viewLoadedWasCalled = true
        }
    }

}
