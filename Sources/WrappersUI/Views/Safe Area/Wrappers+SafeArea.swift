//
//  Wrappers+SafeArea.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers {

    public final class SafeArea: WrapperView {

        private let edges: Edge.Set

        init(
            original: OriginalView,
            wrapped: WrappedView,
            edges: Edge.Set
        ) {
            self.edges = edges
            super.init(original: original, wrapped: wrapped)
        }
    }
}

extension Wrappers.SafeArea: ViewCodable {

    func buildHierarchy() {
        append(wrappedView)
    }

    func setupConstraints() {
        wrappedView.anchor(edges.contains(.top) ? safeAreaLayoutGuide : self).top.equal()
        wrappedView.anchor(edges.contains(.bottom) ? safeAreaLayoutGuide : self).bottom.equal()
        wrappedView.anchor(edges.contains(.leading) ? safeAreaLayoutGuide : self).leading.equal()
        wrappedView.anchor(edges.contains(.trailing) ? safeAreaLayoutGuide : self).trailing.equal()
    }
}
