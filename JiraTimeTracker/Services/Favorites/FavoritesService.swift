//
//  FavoritesService.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 11.10.2020.
//

import Foundation
import NodeKit

protocol FavoritesService {
    func add(issue: IssueEntity) -> Observer<Void>
    func delete(issue: IssueEntity) -> Observer<Void>
    func getAll() -> Observer<[IssueEntity]>
}
