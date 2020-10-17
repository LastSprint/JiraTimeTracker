//
//  IssueNetworkService.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct JiraIssuesNetworkService {

    private let favoritesService: FavoritesService

    private var builder: AuthorizedChainBuilder<JiraIssuesRoutes> {
        .init()
    }

    init(favoritesService: FavoritesService) {
        self.favoritesService = favoritesService
    }
}

extension JiraIssuesNetworkService: JiraIssuesService {
    func getRelativeIssues(for projectKey: String) -> Observer<[IssueEntity]> {

        let jql = "project=\(projectKey) and status!=Done and status!=Rejected and assignee=currentUser()"

        return self.builder
            .route(.get, .search)
            .set(query: ["jql": jql, "maxResults": 100, "startAt": 0])
            .build()
            .process()
            .map { (model: PagingEntity) in
                return model.issues
            }.combine(self.favoritesService.getAll())
            .map { (jiraIssues, favoritesIssues) in

                jiraIssues.map { issue in
                    guard favoritesIssues.contains(where: { $0.id == issue.id }) else {
                        return issue
                    }

                    var mutable = issue
                    mutable.isFavorite = true
                    return mutable
                }
            }.dispatchOn(.main)
    }

    func updateWorklog(issue: IssueEntity, seconds: Int) -> Observer<Void> {
        return self.builder
            .route(.post, .worklog(issue.key))
            .build()
            .process(UpdateWorklogEntity(comment: "Surf Tracker", timeSpentSeconds: seconds))
    }
}
