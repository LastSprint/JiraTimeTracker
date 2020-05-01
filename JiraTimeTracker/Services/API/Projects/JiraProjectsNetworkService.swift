//
//  JiraProjectsNetworlService.swift
//  Jtrack
//

import Foundation
import NodeKit

struct JiraProjectsNetworkService {

    private var builder: UrlChainsBuilder<JiraProjectsRoutes> {
        .init()
    }
}

// MARK: - JiraProjectsService

extension JiraProjectsNetworkService: JiraProjectsService {
    func getRecentProjects(recentCount: Int) -> Observer<[ShortProjectEntity]> {
        return self.builder
            .route(.get, .projects)
            .set(query: ["recent": recentCount])
            .build()
            .process()
    }
}
