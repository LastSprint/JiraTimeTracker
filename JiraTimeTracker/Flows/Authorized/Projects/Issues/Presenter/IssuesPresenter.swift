//
//  IssuesPresenter.swift
//  JiraTimeTracker
//

final class IssuesPresenter: IssuesViewOutput, IssuesModuleInput, IssuesModuleOutput {

    // MARK: - IssuesModuleOutput

    // MARK: - Properties

    private let project: ShortProjectEntity

    weak var view: IssuesViewInput?

    init(project: ShortProjectEntity) {
        self.project = project
    }

    // MARK: - IssuesViewOutput

    func viewLoaded() {
        view?.setupInitialState(project: self.project)
    }

    // MARK: - IssuesModuleInput

}
