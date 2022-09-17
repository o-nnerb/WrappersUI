//
//  Wrappers+Rounded.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers {

    public final class Rounded: WrapperView {

        private let constant: CGFloat

        init(
            original: OriginalView,
            wrapped: WrappedView,
            constant: CGFloat
        ) {
            self.constant = constant
            super.init(original: original, wrapped: wrapped)
        }

        public override func layoutSubviews() {
            super.layoutSubviews()
            updateRadius()
        }
    }
}

extension Wrappers.Rounded: ViewCodable {

    func buildHierarchy() {
        append(wrappedView)
    }

    func setupConstraints() {
        wrappedView.anchor.edges.equal()
    }

    func applyAdditionalChanges() {
        clipsToBounds = true
    }
}

private extension Wrappers.Rounded {

    func updateRadius() {
        guard constant.isInfinite else {
            layer.cornerRadius = constant
            return
        }

        layer.cornerRadius = min(bounds.height, bounds.width) / 2
    }
}
