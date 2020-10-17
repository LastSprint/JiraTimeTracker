//
//  FavoritesListViewController.swift
//  JiraTimeTracker
//

import UIKit
import ReactiveDataDisplayManager

final class FavoritesListViewController: UIViewController, FavoritesListViewInput {

    // MARK: - IBOutlet

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    private lazy var ddm = BaseTableDataDisplayManager(collection: self.tableView)
    private var generators = [IssueCellGenerator]()

    var output: FavoritesListViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        self.view.backgroundColor = Styles.Colors.Main.background.color
        self.tableView.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .white
        self.tableView.separatorStyle = .none
    }

    // MARK: - FavoritesListViewInput

    func setupInitialState(project: ShortProjectEntity) { }

}

extension FavoritesListViewController {
    func show(issues: [IssueEntity]) {

        self.ddm.clearCellGenerators()
        self.ddm.clearHeaderGenerators()

        let gens = issues.map { issue -> IssueCellGenerator in
            let gen = IssueCellGenerator(model: issue)

            gen.onStartTracking = { [weak self] model in
                self?.output?.startTrackIssue(issue: model)
            }

            gen.onEndTracking = { [weak self] args in
                let (issue, seconds) = args
                self?.output?.stopTrackIssue(issue: issue, seconds: seconds)
            }

            return gen
        }

        self.ddm.addCellGenerators(gens)

        self.ddm.forceRefill()

        self.generators = gens
    }

    func stopAll(except issue: IssueEntity) {
        self.generators.forEach { gen in

            guard gen.model.id != issue.id else {
                return
            }

            gen.forceStop()
        }
    }

    func restore(issue: IssueEntity, seconds: Int) {
        self.generators.forEach { gen in

            guard gen.model.id == issue.id else {
                return
            }

            gen.restoreState(seconds: seconds)
        }
    }

    func commit(issue: IssueEntity, seconds: Int) {
        self.generators.forEach { gen in

            guard gen.model.id == issue.id else {
                return
            }

            gen.commitState(seconds: seconds)
        }
    }
}
