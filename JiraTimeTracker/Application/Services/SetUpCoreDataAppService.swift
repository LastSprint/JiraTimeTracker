//
//  SetUpCoreData.swift
//  JiraTimeTrackerDebug
//

import Foundation
import PluggableApplicationDelegate
import CoreData

final class SetUpCoreDataAppService: NSObject, ApplicationService {

    lazy var persistenceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JTrackModel")

        container.loadPersistentStores { (descr, error) in
            print(descr)
            guard let error = error else { return }
            fatalError("Whileinitialize NSPersistentContainer an error occured: \(error)")
        }

        return container
    }()
}
