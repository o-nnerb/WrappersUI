//
//  AlignmentViewable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
public protocol AlignmentViewable: UIView {}

public extension AlignmentViewable {

    func alignment(
        _ edges: AlignmentEdges,
        _ priority: UILayoutPriority = .required
    ) -> Wrappers<Self, Self>.Alignment {
        .init(
            original: self,
            wrapped: self,
            edges: edges,
            priority: priority
        )
    }
}

public extension AlignmentViewable where Self: WrapperViewable {

    func alignment(
        _ edges: AlignmentEdges,
        _ priority: UILayoutPriority = .required
    ) -> Wrappers<OriginalView, Self>.Alignment {
        .init(
            original: originalView,
            wrapped: self,
            edges: edges,
            priority: priority
        )
    }
}

extension UIView: AlignmentViewable {}
