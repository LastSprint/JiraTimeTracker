//
//  JiraProjectService.swift
//  Jtrack
//

import NodeKit

protocol JiraProjectsService {
    /// Returns the number of recently visited projects
    func getRecentProjects(recentCount: Int) -> Observer<[ShortProjectEntity]>
}
