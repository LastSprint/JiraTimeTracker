//
//  IssuePriorityEntry.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct IssuePriorityEntry: Codable {
    let iconUrl: String
    let name: String
    let id: String
}

extension IssuePriorityEntry: RawMappable {
    typealias Raw = Json
}
