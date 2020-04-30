//
//  AuthModuleConfigurator.swift
//  JiraTimeTracker
//

import UIKit

final class AuthModuleConfigurator {

    // MARK: - Internal methods

    func configure() -> (AuthViewController, AuthModuleOutput) {
        guard let view = UIStoryboard(name: String(describing: AuthViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? AuthViewController else {
            fatalError("Can't load AuthViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = AuthPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
