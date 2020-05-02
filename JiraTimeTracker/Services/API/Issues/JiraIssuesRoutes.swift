//
//  IssuesRoutes.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

enum JiraIssuesRoutes {
    case search
    case worklog(String)
}

extension JiraIssuesRoutes: UrlRouteProvider {
    func url() throws -> URL {
        switch self {
        case .search:
            return try ApiConstants.base + "/search"
        case .worklog(let idOrKey):
            return try ApiConstants.base + "/issue/\(idOrKey)/worklog"
        }
    }
}
