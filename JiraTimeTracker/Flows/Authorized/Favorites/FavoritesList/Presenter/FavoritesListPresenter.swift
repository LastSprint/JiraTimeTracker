//
//  FavoritesListPresenter.swift
//  JiraTimeTracker
//

final class FavoritesListPresenter: FavoritesListViewOutput, FavoritesListModuleInput, FavoritesListModuleOutput {

    // MARK: - FavoritesListModuleOutput

    // MARK: - Properties

    private let nested: IssuesPresenter
    private let favoritesService: FavoritesService

    weak var view: FavoritesListViewInput?

    init(service: JiraIssuesService, favoritesService: FavoritesService) {
        self.nested = IssuesPresenter(project: .init(id: "", key: "", name: "", avatarUrls: .init(avatar16x16: "", avatar24x24: "", avatar32x32: "", avatar48x48: ""), category: .init(description: "")), service: service, favoritesService: favoritesService)

        self.favoritesService = favoritesService
        self.nested.view = self.view
    }

    // MARK: - FavoritesListViewOutput

    func viewLoaded() {
        self.nested.viewLoaded()
        self.load()
    }

    // MARK: - FavoritesListModuleInput

}

extension FavoritesListPresenter {
    func onIssueSelected(issue: IssueEntity) {
        self.nested.onIssueSelected(issue: issue)
    }

    func startTrackIssue(issue: IssueEntity) {
        self.nested.startTrackIssue(issue: issue)
    }

    func stopTrackIssue(issue: IssueEntity, seconds: Int) {
        self.nested.stopTrackIssue(issue: issue, seconds: seconds)
    }
}

private extension FavoritesListPresenter {

    func load() {
        self.favoritesService.getAll().onCompleted { [weak self] items in
            self?.view?.show(issues: items)
        }.onError { [weak self] err in
            self?.view?.show(error: err)
        }
    }
}
