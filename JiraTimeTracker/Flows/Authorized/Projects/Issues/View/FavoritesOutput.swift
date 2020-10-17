//
//  FavoritesOutput.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 17.10.2020.
//

import Foundation

protocol FavoritesOutput {
    func setFavorite(for issue: IssueEntity)
}
