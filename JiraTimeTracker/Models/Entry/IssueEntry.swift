//
//  IssueEntry.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct IssueEntry: Codable {
    let id: String
    let key: String
    let fields: IssueFieldEntry
}

extension IssueEntry: RawMappable {
    typealias Raw = Json
}
