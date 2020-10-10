//
//  Copyright © 2020 Surf. All rights reserved.
//

import PluggableApplicationDelegate

final class LaunchingRootView: NSObject, ApplicationService {

    // MARK: - Properties

    private let appCoord = ApplicationCoordinator()
    private let storage: UserDataStorage

    // MARK: - Initializer

    init(storage: UserDataStorage) {
        self.storage = storage
        super.init()
    }

    // MARK: - ApplicationService

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        self.startFirstFlow()
        return true
    }
}

private extension LaunchingRootView {

    func startFirstFlow() {
        let window = UIWindow()
        self.window = window
        window.rootViewController = UIViewController()
        window.makeKeyAndVisible()

        // if we can read token it means that we can skip auth flow
        // and move user immideately to main app screen
        guard let token = self.getToken() else {
            self.appCoord.start(option: .auth)
            return
        }

        AppDelegate.authToken = token
        self.appCoord.start(option: .skipAuth)
    }

    func getToken() -> String? {
        return try? self.storage.read()
    }
}
