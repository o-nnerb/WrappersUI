//
//  Wrappers+ResizableFrame.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers {

    @MainActor
    public final class ResizableFrame: WrapperView {

        private let minWidth: CGFloat?
        private let idealWidth: CGFloat?
        private let maxWidth: CGFloat?
        private let minHeight: CGFloat?
        private let idealHeight: CGFloat?
        private let maxHeight: CGFloat?

        init(
            original: OriginalView,
            wrapped: WrappedView,
            minWidth: CGFloat? = nil,
            idealWidth: CGFloat? = nil,
            maxWidth: CGFloat? = nil,
            minHeight: CGFloat? = nil,
            idealHeight: CGFloat? = nil,
            maxHeight: CGFloat? = nil
        ) {
            self.minWidth = minWidth
            self.idealWidth = idealWidth
            self.maxWidth = maxWidth
            self.minHeight = minHeight
            self.idealHeight = idealHeight
            self.maxHeight = maxHeight
            super.init(original: original, wrapped: wrapped)
        }
    }
}

extension Wrappers.ResizableFrame: ViewCodable {

    func buildHierarchy() {
        append(wrappedView)
    }

    func setupConstraints() {
        wrappedView.anchor.edges.equal()

        if let minWidth = minWidth {
            anchor.width.greaterThanOrEqual(constant: minWidth)
        }

        if let idealWidth = idealWidth {
            anchor.width.equal(constant: idealWidth, priority: .defaultLow)
        }

        if let maxWidth = maxWidth {
            anchor.width.lessThanOrEqual(constant: maxWidth)
        }

        if let minHeight = minHeight {
            anchor.height.greaterThanOrEqual(constant: minHeight)
        }

        if let idealHeight = idealHeight {
            anchor.height.equal(constant: idealHeight, priority: .defaultLow)
        }

        if let maxHeight = maxHeight {
            anchor.height.lessThanOrEqual(constant: maxHeight)
        }
    }
}
