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
        self.navigationItem.backBarButtonItem = .init(title: nil, style: .plain, target: nil, action: nil)
        self.tableView.separatorStyle = .none
    }

    // MARK: - IssuesViewInput

    func setupInitialState(project: ShortProjectEntity) {
        self.navigationItem.title = project.name
    }

    func show(issues: [IssueEntity]) {

        self.ddm.clearCellGenerators()
        self.ddm.clearHeaderGenerators()

        let gens = issues.map { issue -> IssueCellGenerator in
            let gen = IssueCellGenerator(model: issue)
//            gen.didSelectEvent += { [weak self] in
//                self?.output?.onIssueSelected(issue: issue)
//            }

            return gen
        }

        self.ddm.addCellGenerators(gens)

        self.ddm.forceRefill()
    }

}
