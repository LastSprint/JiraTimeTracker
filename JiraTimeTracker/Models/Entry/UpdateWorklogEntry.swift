//
//  UpdateWorklogEntry.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct UpdateWorklogEntry: Codable {
    let comment: String
    let timeSpentSeconds: Int
}

extension UpdateWorklogEntry: RawMappable {
    typealias Raw = Json
}
