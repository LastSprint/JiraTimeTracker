//
//  Copyright © 2020 Surf. All rights reserved.
//

import PluggableApplicationDelegate
import UIKit

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {

    /// Now you think like "Oh, wtf?"
    /// And i will say that save token in memory is more secure that save it in keychain
    ///
    /// Because i use Basic auth and, you know, it's just login and password in Base64 (:
    static var authToken: String?

    // MARK: - Properties

    override var services: [ApplicationService] {
        return [
            LaunchingRootView()
        ]
    }

}
