//
//  JiraProjectRoutes.swift
//  Jtrack
//

import NodeKit

enum JiraProjectsRoutes {
    case projects
}

extension JiraProjectsRoutes: UrlRouteProvider {
    func url() throws -> URL {
        switch self {
        case .projects:
            return try ApiConstants.base + "/project"
        }
    }
}
