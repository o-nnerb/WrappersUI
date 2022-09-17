//
//  Wrappers+Alignment.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers {

    public final class Alignment: WrapperView {

        private let edges: AlignmentEdges
        private let priority: UILayoutPriority

        init(
            original: OriginalView,
            wrapped: WrappedView,
            edges: AlignmentEdges,
            priority: UILayoutPriority
        ) {
            self.edges = edges
            self.priority = priority
            super.init(original: original, wrapped: wrapped)
        }
    }
}

extension Wrappers.Alignment: ViewCodable {

    public func buildHierarchy() {
        append(wrappedView)
    }

    // swiftlint:disable function_body_length cyclomatic_complexity
    public func setupConstraints() {
        switch edges {
        case .top:
            applyTopConstraints()

        case .topLeft:
            applyTopLeftConstraints()

        case .topRight:
            applyTopRightConstraints()

        case .left:
            applyLeftConstraints()

        case .right:
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

extension Wrappers.Alignment {

    func applyEdgesConstraints() {
        wrappedView.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.equal(priority: priority)
            $0.trailing.equal(priority: priority)
            $0.bottom.equal(priority: priority)
        }
    }

    func applyTopConstraints() {
        wrappedView.anchor(self) {
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
        wrappedView.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
        }
    }

    func applyTopRightConstraints() {
        wrappedView.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.equal(priority: priority)
        }
    }

    func applyLeftConstraints() {
        wrappedView.anchor(self) {
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
        wrappedView.anchor(self) {
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
        wrappedView.anchor(self) {
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
        wrappedView.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
        }
    }

    func applyBottomRightConstraints() {
        wrappedView.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.equal(priority: priority)
        }
    }

    func applyVerticalConstraints() {
        wrappedView.anchor(self) {
            $0.top.greaterThanOrEqual(priority: priority)
            $0.leading.equal(priority: priority)
            $0.bottom.lessThanOrEqual(priority: priority)
            $0.trailing.equal(priority: priority)
            $0.centerY.equal(priority: priority)
        }
    }

    func applyHorizontalConstraints() {
        wrappedView.anchor(self) {
            $0.top.equal(priority: priority)
            $0.leading.greaterThanOrEqual(priority: priority)
            $0.bottom.equal(priority: priority)
            $0.trailing.lessThanOrEqual(priority: priority)
            $0.centerX.equal(priority: priority)
        }
    }

    func applyCenterConstraints() {
        wrappedView.anchor(self) {
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
