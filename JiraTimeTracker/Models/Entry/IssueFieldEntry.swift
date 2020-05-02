//
//  IssueFieldEntry.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct IssueFieldEntry: Codable {
    let description: String?
    let summary: String
    let issuetype: IssueTypeEntry
    let priority: IssuePriorityEntry?
    let status: IssueStatusEntry

    let aggregatetimeoriginalestimate: Int?
    let timespent: Int?
}

extension IssueFieldEntry: RawMappable {
    typealias Raw = Json
}
