//
//  ProjectsViewController.swift
//  JiraTimeTracker
//

import UIKit
import ReactiveDataDisplayManager

final class ProjectsListViewController: UIViewController, ProjectsListViewInput {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: ProjectsListViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        self.view.backgroundColor = Styles.Colors.Main.background.color
    }

    // MARK: - ProjectsViewInput

    func setupInitialState() {

    }

}
