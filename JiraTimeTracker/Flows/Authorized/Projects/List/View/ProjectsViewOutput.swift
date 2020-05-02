//
//  ProjectsViewOutput.swift
//  JiraTimeTracker
//

protocol ProjectsListViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()

    func onSelect(project: ShortProjectEntity)
}
