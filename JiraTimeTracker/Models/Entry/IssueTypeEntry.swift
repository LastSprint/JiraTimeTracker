//
//  IssueTypeEntry.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct IssueTypeEntry: Codable {
    let id: String
    let iconUrl: String
    let name: String
}

extension IssueTypeEntry: RawMappable {
    typealias Raw = Json
}
