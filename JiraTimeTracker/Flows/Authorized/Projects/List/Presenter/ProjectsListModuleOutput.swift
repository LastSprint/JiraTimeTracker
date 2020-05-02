//
//  ProjectsModuleOutput.swift
//  JiraTimeTracker
//

protocol ProjectsListModuleOutput: class {

    var onProjectSelect: Closure<ShortProjectEntity>? { get set }
}
