//
//  TabBarViewController.swift
//  JiraTimeTracker
//

import UIKit

final class TabBarViewController: UITabBarController, TabBarViewInput {

    // MARK: - Properties

    var output: TabBarViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        self.delegate = self
    }

    // MARK: - TabBarViewInput

    func setupInitialState() {
        self.createTabs()
    }

    func select(tab: Tab) {
        guard
            let view = viewControllers?[tab.rawValue]
//            self.tabBarController(self, didSelect: view)
        else {
            return
        }
        selectedIndex = tab.rawValue
        tabBarController(self, didSelect: view)
    }

}

// MARK: - UITabBarControllerDelegate

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let tab = Tab(rawValue: tabBarController.selectedIndex) else {
            return
        }

        self.output?.didSelect(tab: tab)
    }
}

// MARK: - Configuration

private extension TabBarViewController {
    func createTabs() {
        self.viewControllers = Tab.allCases.map { tab in

            let tabItem = UITabBarItem(title: tab.name,
                                       image: tab.icon,
                                       selectedImage: Styles.Image.TabBar.projectsItem.image.withRenderingMode(.alwaysTemplate))

            self.tabBar.tintColor = Styles.Colors.Main.white.color
            let vc = UINavigationController()
            vc.tabBarItem = tabItem
            return vc
        }
    }
}
