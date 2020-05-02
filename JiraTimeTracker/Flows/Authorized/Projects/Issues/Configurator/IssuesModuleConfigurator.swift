//
//  IssuesModuleConfigurator.swift
//  JiraTimeTracker
//

import UIKit

final class IssuesModuleConfigurator {

    // MARK: - Internal methods

    func configure(for project: ShortProjectEntity) -> (IssuesViewController, IssuesModuleOutput) {
        guard let view = UIStoryboard(name: String(describing: IssuesViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? IssuesViewController else {
            fatalError("Can't load IssuesViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = IssuesPresenter(project: project)

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
