//
//  ProjectsPresenter.swift
//  JiraTimeTracker
//

final class ProjectsListPresenter: ProjectsListViewOutput, ProjectsListModuleInput, ProjectsListModuleOutput {

    // MARK: - ProjectsModuleOutput

    // MARK: - Properties

    weak var view: ProjectsListViewInput?

    // MARK: - ProjectsViewOutput

    func viewLoaded() {
        view?.setupInitialState()
    }

    // MARK: - ProjectsModuleInput

}
