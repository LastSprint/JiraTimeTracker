//
//  IssueNetworkService.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct JiraIssuesNetworkService {
    private var builder: AuthorizedChainBuilder<JiraIssuesRoutes> {
        .init()
    }
}

extension JiraIssuesNetworkService: JiraIssuesService {
    func getRelativeIssues(for projectKey: String) -> Observer<[IssueEntity]> {

        let jql = "project=\(projectKey) and status!=Done and assignee=currentUser()"

        return self.builder
            .route(.get, .search)
            .set(query: ["jql": jql])
            .build()
            .process()
            .map { (model: PagingEntity) in
                return model.issues
            }
    }
}
