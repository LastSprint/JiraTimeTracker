//
//  FavoritesStorage.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit
import CoreData

struct FavoritesStorage: FavoritesService {

    private let container: NSPersistentContainer

    init(container: NSPersistentContainer) {
        self.container = container
    }

    func add(issue: IssueEntity) -> Observer<Void> {

        let context = self.container.newBackgroundContext()
        context.mergePolicy = NSMergePolicy(merge: .overwriteMergePolicyType)

        let result = Context<Void>()

        context.perform {
            _ = DBIssueEntity.fromPlain(context: context, plain: issue)
            do {
                try context.save()
                result.emit(data: ())
            } catch {
                result.emit(error: error)
            }
        }
        return result
    }

    func delete(issue: IssueEntity) -> Observer<Void> {
        let context = self.container.newBackgroundContext()
        let result = Context<Void>()

        context.perform {
            let req: NSFetchRequest<DBIssueEntity> = DBIssueEntity.fetchRequest()

            req.predicate = NSPredicate(format: "key==%@", issue.key)

            req.fetchLimit = 1

            do {
                let fr = try context.fetch(req)

                guard let item = fr.first else {
                    result.emit(data: ())
                    return
                }

                context.delete(item)
                try context.save()
                result.emit(data: ())
            } catch {
                result.emit(error: error)
            }
        }

        return result
    }

    func getAll() -> Observer<[IssueEntity]> {
        let context = self.container.newBackgroundContext()

        let result = Context<[IssueEntity]>()

        context.perform {
            do {
                let data = try context.fetch(DBIssueEntity.fetchRequest())
                let mapped = data
                    .compactMap { $0 as? DBIssueEntity }
                    .map { $0.toPlain() }

                result.emit(data: mapped)
            } catch {
                result.emit(error: error)
            }
        }

        return result
    }
}
