//
//  Tabs.swift
//  JiraTimeTrackerDebug
//

import Foundation

enum Tab: Int, CaseIterable {
    case projects = 0
}

extension Tab {
    var name: String {
        switch self {
        case .projects:
            return L10n.TabBar.Items.Projects.title
        }
    }
}
