//
//  Wrappers+Frame.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers {

    @MainActor
    public final class Frame: WrapperView {

        private let width: CGFloat?
        private let height: CGFloat?

        init(
            original: OriginalView,
            wrapped: WrappedView,
            width: CGFloat?,
            height: CGFloat?
        ) {
            self.width = width
            self.height = height
            super.init(original: original, wrapped: wrapped)
        }
    }
}

extension Wrappers.Frame: ViewCodable {

    func buildHierarchy() {
        append(wrappedView)
    }

    func setupConstraints() {
        wrappedView.anchor.edges.equal()

        if let width = width {
            anchor.width.equal(constant: width)
        }

        if let height = height {
            anchor.height.equal(constant: height)
        }
    }
}
