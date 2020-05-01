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
            .set(query: ["recent": recentCount])
            .build()
            .process()
    }
}
