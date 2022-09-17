//
//  Wrappers+Background.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers {

    @MainActor
    public final class Background<Background: UIView>: WrapperView {

        public let background: Background

        private let edges: WrappersUI.Alignment?
        private let priority: UILayoutPriority

        init(
            original: OriginalView,
            wrapped: WrappedView,
            background: Background,
            edges: WrappersUI.Alignment?,
            priority: UILayoutPriority
        ) {
            self.background = background
            self.edges = edges
            self.priority = priority
            super.init(original: original, wrapped: wrapped)
        }
    }
}

extension Wrappers.Background: ViewCodable {

    public func buildHierarchy() {
        append(background)
        append(wrappedView)
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

private extension Wrappers.Background {

    func applyEdgesConstraints() {
        background.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.equal(priority: priority)
            $0.trailing.equal(priority: priority)
            $0.bottom.equal(priority: priority)
        }
    }

    func applyTopConstraints() {
        background.anchor(self) {
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
        background.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
        }
    }

    func applyTopRightConstraints() {
        background.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.equal(priority: priority)
        }
    }

    func applyLeftConstraints() {
        background.anchor(self) {
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
        background.anchor(self) {
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
        background.anchor(self) {
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
        background.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
        }
    }

    func applyBottomRightConstraints() {
        background.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.equal(priority: priority)
        }
    }

    func applyVerticalConstraints() {
        background.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.equal(priority: priority)
            $0.centerY.equal(priority: priority)
        }
    }

    func applyHorizontalConstraints() {
        background.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
            $0.centerX.equal(priority: priority)
        }
    }

    func applyCenterConstraints() {
        background.anchor(self) {
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
