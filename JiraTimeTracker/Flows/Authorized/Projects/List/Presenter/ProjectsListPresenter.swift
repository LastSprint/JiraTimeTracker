//
//  ProjectsPresenter.swift
//  JiraTimeTracker
//

final class ProjectsListPresenter: ProjectsListViewOutput, ProjectsListModuleInput, ProjectsListModuleOutput {

    // MARK: - ProjectsModuleOutput

    var onProjectSelect: Closure<ShortProjectEntity>?

    // MARK: - Properties

    private let service: JiraProjectsService

    weak var view: ProjectsListViewInput?

    // MARK: - Init

    init(service: JiraProjectsService) {
        self.service = service
    }

    // MARK: - ProjectsViewOutput

    func viewLoaded() {
        self.load()
    }

    func onSelect(project: ShortProjectEntity) {
        self.onProjectSelect?(project)
    }

}

// MARK: - Loading

private extension ProjectsListPresenter {
    func load() {
        self.service
            .getRecentProjects(recentCount: 15)
            .onCompleted { [weak self] model in
                self?.view?.setupInitialState(models: model)
            }.onError { error in
                self.view?.show(error: error)
            }
    }
}
