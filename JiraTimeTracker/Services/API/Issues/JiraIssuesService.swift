//
//  IssuesService.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

protocol JiraIssuesService {
    /// Return isues that:
    /// - Assignee is current user
    /// - Status not Done
    ///
    /// - Parameter projectKey: Jira project Key (like JTT)
    func getRelativeIssues(for projectKey: String) -> Observer<[IssueEntity]>
}
