//
//  IssueStatusEntry.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct IssueStatusEntry: Codable {
    let name: String
}

extension IssueStatusEntry: RawMappable {
    typealias Raw = Json
}
