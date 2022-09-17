//
//  Wrappers+Tap.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers {

    public class Tap: WrapperView {

        private let action: () -> Void

        init(
            original: OriginalView,
            wrapped: WrappedView,
            perform action: @escaping () -> Void
        ) {
            self.action = action
            super.init(original: original, wrapped: wrapped)
        }

        @objc
        fileprivate func userDidTap() {
            action()
        }
    }
}

extension Wrappers.Tap: ViewCodable {

    func buildHierarchy() {
        append(wrappedView)
    }

    func setupConstraints() {
        wrappedView.anchor.edges.equal()
    }

    func applyAdditionalChanges() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userDidTap)))
    }
}
