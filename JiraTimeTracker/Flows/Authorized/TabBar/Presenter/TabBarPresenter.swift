//
//  TabBarPresenter.swift
//  JiraTimeTracker
//

final class TabBarPresenter: TabBarViewOutput, TabBarModuleInput, TabBarModuleOutput {

    // MARK: - TabBarModuleOutput

    var onTabSelected: Closure<Tab>?

    // MARK: - Properties

    weak var view: TabBarViewInput?

    // MARK: - TabBarViewOutput

    func viewLoaded() {
        view?.setupInitialState()
    }

    func didSelect(tab: Tab) {
        self.onTabSelected?(tab)
    }

    // MARK: - TabBarModuleInput

    func select(tab: Tab) {
        self.view?.select(tab: tab)
    }
}
