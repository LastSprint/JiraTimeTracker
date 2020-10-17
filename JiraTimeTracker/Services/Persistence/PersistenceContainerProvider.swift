//
//  PersistenceContainerProvider.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 17.10.2020.
//

import Foundation
import CoreData

struct PersistencrContainerProvider {
    var container: NSPersistentContainer {
        return AppDelegate.coreDataService.persistenceContainer
    }
}
