//
//  IssuesRoutes.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

enum JiraIssuesRoutes {
    case search
}

extension JiraIssuesRoutes: UrlRouteProvider {
    func url() throws -> URL {
        switch self {
        case .search:
            return try ApiConstants.base + "/search"
        }
    }
}
