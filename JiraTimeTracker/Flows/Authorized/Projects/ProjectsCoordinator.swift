//
//  ProjectsCoordinator.swift
//  JiraTimeTrackerDebug
//

import Foundation

final class ProjectsCoordinator: BaseCoordinator {

    private let router: Router

    private var isStarted = false

    init(router: Router) {
        self.router = router
    }

    override func start() {

        guard !self.isStarted else {
            return
        }

        self.isStarted = true

        self.runListFlow()
    }
}

private extension ProjectsCoordinator {
    func runListFlow() {

        let (view, output) = ProjectsListModuleConfigurator().configure()

        self.router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }
}
