//
//  ProjectsModuleConfigurator.swift
//  JiraTimeTracker
//

import UIKit

final class ProjectsListModuleConfigurator {

    // MARK: - Internal methods

    func configure() -> (ProjectsListViewController, ProjectsListModuleOutput) {
        guard let view = UIStoryboard(name: String(describing: ProjectsListViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? ProjectsListViewController else {
            fatalError("Can't load ProjectsViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = ProjectsListPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
