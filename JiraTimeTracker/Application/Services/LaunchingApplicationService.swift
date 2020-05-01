//
//  Copyright © 2020 Surf. All rights reserved.
//

import PluggableApplicationDelegate

final class LaunchingRootView: NSObject, ApplicationService {

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

        window.rootViewController = AuthModuleConfigurator().configure().0

        self.window = window

        window.makeKeyAndVisible()
    }
}
