//
//  IssuesPresenter.swift
//  JiraTimeTracker
//

import Foundation

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

    func startTrackIssue(issue: IssueEntity) {
        self.view?.stopAll(except: issue)
    }

    func stopTrackIssue(issue: IssueEntity, seconds: Int) {

        if seconds < 30 {
            self.view?.show(warning: "\(seconds) секунд это слишком мало 🙃")
            self.view?.commit(issue: issue, seconds: issue.fields.timespent)
            return
        }

        let offsetSeconds = seconds % 60

        var mutadedSecond = seconds

        if offsetSeconds < 30 {
            mutadedSecond -= offsetSeconds
        } else if offsetSeconds != 0 {
            mutadedSecond += 60 - offsetSeconds
        }

        self.service
            .updateWorklog(issue: issue, seconds: mutadedSecond)
            .onCompleted { [weak self] in
                self?.view?.show(success: "Затрекано: \(mutadedSecond.timeView)")
                self?.view?.commit(issue: issue, seconds: issue.fields.timespent + mutadedSecond)
            }.onError { [weak self] err in
                self?.view?.show(error: err)
                self?.view?.restore(issue: issue, seconds: mutadedSecond)
            }
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
