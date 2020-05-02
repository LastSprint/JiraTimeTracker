//
//  ProjectCategoryEntry.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct ProjectCategoryEntry: Codable {
    let description: String
}

extension ProjectCategoryEntry: RawMappable {
    typealias Raw = Json
}
