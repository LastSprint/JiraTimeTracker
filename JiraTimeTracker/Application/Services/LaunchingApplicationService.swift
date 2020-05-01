//
//  Copyright © 2020 Surf. All rights reserved.
//

import PluggableApplicationDelegate

final class LaunchingRootView: NSObject, ApplicationService {

    // MARK: - Properties

    private let appCoord = ApplicationCoordinator()

    // MARK: - ApplicationService

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        self.startFurstFlow()
        return true
    }
}

private extension LaunchingRootView {

    func startFurstFlow() {
        let window = UIWindow()
        self.window = window
        window.rootViewController = UIViewController()
        window.makeKeyAndVisible()
        self.appCoord.start()
    }
}
