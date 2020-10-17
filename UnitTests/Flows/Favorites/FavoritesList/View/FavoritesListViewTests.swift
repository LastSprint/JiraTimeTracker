//
//  FavoritesListViewTests.swift
//  JiraTimeTracker
//

import XCTest
@testable import JiraTimeTrackerRelease

final class FavoritesListViewTests: XCTestCase {

    // MARK: - Properties

    private var view: FavoritesListViewController?
    private var output: FavoritesListViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = FavoritesListViewController()
        output = FavoritesListViewOutputMock()
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

    final class FavoritesListViewOutputMock: FavoritesListViewOutput {
        var viewLoadedWasCalled: Bool = false

        func viewLoaded() {
            viewLoadedWasCalled = true
        }
    }

}
