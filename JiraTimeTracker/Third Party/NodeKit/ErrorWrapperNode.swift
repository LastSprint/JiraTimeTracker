//
//  ErrorWrapperNode.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct WrappedError: LocalizedError {

    let wrapped: Error

    init(wrapped: Error) {
        self.wrapped = wrapped
    }

    var errorDescription: String? {
        return L10n.Errors.Common.Erased.title
    }
}

final class ErrorWrapperNode<I, O>: Node<I, O> {

    var next: Node<I, O>

    init(next: Node<I, O>) {
        self.next = next
    }

    override func process(_ data: I) -> Observer<O> {
        self.next.process(data).mapError { WrappedError(wrapped: $0) }
    }
}
