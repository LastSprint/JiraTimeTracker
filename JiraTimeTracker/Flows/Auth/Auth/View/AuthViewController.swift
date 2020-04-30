//
//  AuthViewController.swift
//  JiraTimeTracker
//

import UIKit

final class AuthViewController: UIViewController, AuthViewInput {

    // MARK: - Properties

    var output: AuthViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    // MARK: - AuthViewInput

    func setupInitialState() {

    }

}
