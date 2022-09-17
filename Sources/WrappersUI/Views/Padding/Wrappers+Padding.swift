//
//  Wrappers+Padding.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers {

    public final class Padding: WrapperView {

        private let edges: EdgeInsets

        init(
            original: OriginalView,
            wrapped: WrappedView,
            edges: EdgeInsets
        ) {
            self.edges = edges
            super.init(original: original, wrapped: wrapped)
        }
    }
}

extension Wrappers.Padding: ViewCodable {

    func buildHierarchy() {
        append(wrappedView)
    }

    func setupConstraints() {
        wrappedView.anchor {
            $0.top.equal(constant: edges.top)
            $0.bottom.equal(constant: edges.bottom)
            $0.leading.equal(constant: edges.leading)
            $0.trailing.equal(constant: edges.trailing)
        }
    }
}
