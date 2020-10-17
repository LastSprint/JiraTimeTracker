//
//  FavoritesStorageProvider.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 17.10.2020.
//

import Foundation

struct FavoritesStorageProvider {

    let provider = PersistencrContainerProvider()

    func get() -> FavoritesStorage {
        .init(container: self.provider.container)
    }
}
