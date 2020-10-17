//
//  Tabs.swift
//  JiraTimeTrackerDebug
//

import Foundation
import UIKit

enum Tab: Int, CaseIterable {
    case projects = 0
    case favorites = 1
}

extension Tab {
    var name: String {
        switch self {
        case .projects:
            return L10n.TabBar.Items.Projects.title
        case .favorites:
            return L10n.TabBar.Items.Favorites.title
        }
    }

    var icon: UIImage {
        switch self {
        case .favorites:
            return Styles.Image.Issue.selectedFavorite.image
        case .projects:
            return Styles.Image.TabBar.projectsItem.image
        }
    }
}
