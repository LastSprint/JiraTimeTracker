//
//  PagingModel.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct PagingEntry: Codable {
    let startAt: Int
    let maxResults: Int
    let total: Int
    let issues: [IssueEntry]
}

extension PagingEntry: RawMappable {
    typealias Raw = Json
}
