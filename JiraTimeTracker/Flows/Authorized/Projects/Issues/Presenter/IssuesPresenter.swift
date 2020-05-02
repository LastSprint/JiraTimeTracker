//
//  IssuesPresenter.swift
//  JiraTimeTracker
//

final class IssuesPresenter: IssuesViewOutput, IssuesModuleInput, IssuesModuleOutput {

    // MARK: - IssuesModuleOutput

    var onIssueSelected: Closure<IssueEntity>?

    // MARK: - Properties

    private let project: ShortProjectEntity
    private let service: JiraIssuesService

    weak var view: IssuesViewInput?

    init(project: ShortProjectEntity, service: JiraIssuesService) {
        self.project = project
        self.service = service
    }

    // MARK: - IssuesViewOutput

    func viewLoaded() {
        view?.setupInitialState(project: self.project)
        self.load()
    }

    func onIssueSelected(issue: IssueEntity) {
        self.onIssueSelected?(issue)
    }
}

private extension IssuesPresenter {
    func load() {
        self.service
            .getRelativeIssues(for: self.project.key)
            .onCompleted { [weak self] model in
                self?.view?.show(issues: model)
            }.onError { [weak self] err in
                self?.view?.show(error: err)
            }
    }
}
