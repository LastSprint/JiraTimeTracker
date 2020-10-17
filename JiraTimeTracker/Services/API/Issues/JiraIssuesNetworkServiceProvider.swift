//
//  JiraIssuesNetworkServiceProvider.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 17.10.2020.
//

import Foundation

struct JiraIssuesNetworkServiceProvider {
    func get() -> JiraIssuesNetworkService {
        return .init(favoritesService: FavoritesStorageProvider().get())
    }
}
