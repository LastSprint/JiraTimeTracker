//
//  IssuesPresenter.swift
//  JiraTimeTracker
//

final class IssuesPresenter: IssuesViewOutput, IssuesModuleInput, IssuesModuleOutput {

    // MARK: - IssuesModuleOutput

    // MARK: - Properties

    weak var view: IssuesViewInput?

    // MARK: - IssuesViewOutput

    func viewLoaded() {
        view?.setupInitialState()
    }

    // MARK: - IssuesModuleInput

}
