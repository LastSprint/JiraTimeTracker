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

    private lazy var ddm = BaseTableDataDisplayManager(collection: self.tableView)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        self.view.backgroundColor = Styles.Colors.Main.background.color
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
        self.title = L10n.TabBar.Items.Projects.title
    }

    // MARK: - ProjectsViewInput

    func setupInitialState(models: [ShortProjectEntity]) {

        self.ddm.clearCellGenerators()
        self.ddm.clearHeaderGenerators()

        let gens = models.map { model -> BaseCellGenerator<ShortProjectCell> in
            let gen = BaseCellGenerator<ShortProjectCell>(with: model, registerClass: true)
            gen.didSelectEvent += { [weak self] in
                self?.output?.onSelect(project: model)
            }
            return gen
        }

        self.ddm.addCellGenerators(gens)
        self.ddm.forceRefill()
    }

}
