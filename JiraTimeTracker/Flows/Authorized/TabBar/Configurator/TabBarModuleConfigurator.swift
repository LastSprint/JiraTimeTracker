//
//  TabBarModuleConfigurator.swift
//  JiraTimeTracker
//

import UIKit

final class TabBarModuleConfigurator {

    typealias TabBarModuleConfiguratorResult = (TabBarViewController, TabBarModuleOutput, TabBarModuleInput)

    // MARK: - Internal methods

    func configure() -> TabBarModuleConfiguratorResult {
        guard let view = UIStoryboard(name: String(describing: TabBarViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? TabBarViewController else {
            fatalError("Can't load TabBarViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = TabBarPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter, presenter)
    }

}
