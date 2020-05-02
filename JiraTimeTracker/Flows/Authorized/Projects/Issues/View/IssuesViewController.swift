//
//  IssuesViewController.swift
//  JiraTimeTracker
//

import UIKit
import ReactiveDataDisplayManager

final class IssuesViewController: UIViewController, IssuesViewInput {

    // MARK: - IBOutlet

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    private lazy var ddm = BaseTableDataDisplayManager(collection: self.tableView)

    var output: IssuesViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        self.view.backgroundColor = Styles.Colors.Main.background.color
        self.tableView.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .white
    }

    // MARK: - IssuesViewInput

    func setupInitialState(project: ShortProjectEntity) {
        self.navigationItem.title = project.name
    }

}
