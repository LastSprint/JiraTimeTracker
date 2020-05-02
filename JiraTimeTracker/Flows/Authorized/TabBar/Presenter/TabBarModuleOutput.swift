//
//  TabBarModuleOutput.swift
//  JiraTimeTracker
//

protocol TabBarModuleOutput: class {
    var onTabSelected: Closure<Tab>? { get set }
}
