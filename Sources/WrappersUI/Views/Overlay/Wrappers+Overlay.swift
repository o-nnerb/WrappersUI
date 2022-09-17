//
//  Wrappers+Overlay.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers {

    public final class Overlay<Overlay: UIView>: WrapperView {

        public let overlay: Overlay

        private let edges: WrappersUI.Alignment?
        private let priority: UILayoutPriority

        init(
            original: OriginalView,
            wrapped: WrappedView,
            overlay: Overlay,
            edges: WrappersUI.Alignment?,
            priority: UILayoutPriority
        ) {
            self.overlay = overlay
            self.edges = edges
            self.priority = priority
            super.init(original: original, wrapped: wrapped)
        }
    }
}

extension Wrappers.Overlay: ViewCodable {

    public func buildHierarchy() {
        append(wrappedView)
        append(overlay)
    }

    // swiftlint:disable cyclomatic_complexity
    public func setupConstraints() {
        wrappedView.anchor(self) {
            $0.top.equal()
            $0.bottom.equal()
            $0.leading.equal()
            $0.trailing.equal()
        }

        switch edges {
        case .none:
            applyEdgesConstraints()

        case .top:
            applyTopConstraints()

        case .topLeft:
            applyTopLeftConstraints()

        case .topRight:
            applyTopRightConstraints()

        case .leading:
            applyLeftConstraints()

        case .trailing:
            applyRightConstraints()

        case .bottom:
            applyBottomConstraints()

        case .bottomLeft:
            applyBottomLeftConstraints()

        case .bottomRight:
            applyBottomRightConstraints()

        case .centerY:
            applyVerticalConstraints()

        case .centerX:
            applyHorizontalConstraints()

        case .center:
            applyCenterConstraints()
        }
    }
}

private extension Wrappers.Overlay {

    func applyEdgesConstraints() {
        overlay.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.equal(priority: priority)
            $0.trailing.equal(priority: priority)
            $0.bottom.equal(priority: priority)
        }
    }

    func applyTopConstraints() {
        overlay.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
            $0.centerX.equal(priority: priority)
            $0.leading.equal(priority: .defaultLow)
            $0.trailing.equal(priority: .defaultLow)
        }
    }

    func applyTopLeftConstraints() {
        overlay.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
        }
    }

    func applyTopRightConstraints() {
        overlay.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.equal(priority: priority)
        }
    }

    func applyLeftConstraints() {
        overlay.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
            $0.centerY.equal(priority: priority)
            $0.top.equal(priority: .defaultLow)
            $0.bottom.equal(priority: .defaultLow)
        }
    }

    func applyRightConstraints() {
        overlay.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.equal(priority: priority)
            $0.centerY.equal(priority: priority)
            $0.top.equal(priority: .defaultLow)
            $0.bottom.equal(priority: .defaultLow)
        }
    }

    func applyBottomConstraints() {
        overlay.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
            $0.centerX.equal(priority: priority)
            $0.leading.equal(priority: .defaultLow)
            $0.trailing.equal(priority: .defaultLow)
        }
    }

    func applyBottomLeftConstraints() {
        overlay.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
        }
    }

    func applyBottomRightConstraints() {
        overlay.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.equal(priority: priority)
        }
    }

    func applyVerticalConstraints() {
        overlay.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.equal(priority: priority)
            $0.centerY.equal(priority: priority)
        }
    }

    func applyHorizontalConstraints() {
        overlay.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
            $0.centerX.equal(priority: priority)
        }
    }

    func applyCenterConstraints() {
        overlay.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)

            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)

            $0.centerX.equal(priority: priority)
            $0.centerY.equal(priority: priority)

            $0.top.equal(priority: .defaultLow)
            $0.bottom.equal(priority: .defaultLow)
            $0.leading.equal(priority: .defaultLow)
            $0.trailing.equal(priority: .defaultLow)
        }
    }
}
