//
//  TabBarViewOutput.swift
//  JiraTimeTracker
//

protocol TabBarViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()

    func didSelect(tab: Tab)
}
