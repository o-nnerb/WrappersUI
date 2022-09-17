//
//  ZStackView.swift
//
//
//  Created by onnerb on 17/09/22.
//

import UIKit

@MainActor
open class ZStackView: UIView {

    private let alignment: Alignment?
    private let priority: UILayoutPriority

    open private(set) var arrangedSubviews: [UIView] {
        didSet { updateSubviews() }
    }

    public init(
        alignment: Alignment? = nil,
        priority: UILayoutPriority = .required,
        _ content: [UIView]
    ) {
        self.arrangedSubviews = content
        self.alignment = alignment
        self.priority = priority
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    public init() {
        fatalError("init) has not been implemented")
    }

    @available(*, unavailable)
    override public init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func addArrangedSubview(_ view: UIView) {
        arrangedSubviews.append(view)
    }

    open func removeArrangedSubview(_ view: UIView) {
        arrangedSubviews.removeAll(where: {
            $0 === view
        })
    }

    open func insertArrangedSubview(_ view: UIView, at index: Int) {
        arrangedSubviews.insert(view, at: index)
    }
}

extension ZStackView: ViewCodable {

    func applyAdditionalChanges() {
        updateSubviews()
    }
}

extension ZStackView {

    func updateSubviews() {
        subviews.forEach {
            if !arrangedSubviews.contains($0) {
                $0.removeFromSuperview()
            }
        }

        for (index, subview) in arrangedSubviews.enumerated() where !subviews.contains(subview) {
            insert(subview, at: index)
            setupConstraints(subview)
        }
    }
}

private extension ZStackView {

    // swiftlint:disable cyclomatic_complexity
    func setupConstraints(_ subview: UIView) {
        switch alignment {
        case .none:
            applyEdgesConstraints(subview)

        case .top:
            applyTopConstraints(subview)

        case .topLeft:
            applyTopLeftConstraints(subview)

        case .topRight:
            applyTopRightConstraints(subview)

        case .leading:
            applyLeftConstraints(subview)

        case .trailing:
            applyRightConstraints(subview)

        case .bottom:
            applyBottomConstraints(subview)

        case .bottomLeft:
            applyBottomLeftConstraints(subview)

        case .bottomRight:
            applyBottomRightConstraints(subview)

        case .centerY:
            applyVerticalConstraints(subview)

        case .centerX:
            applyHorizontalConstraints(subview)

        case .center:
            applyCenterConstraints(subview)
        }
    }
}

private extension ZStackView {

    func applyEdgesConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.equal()
            $0.leading.equal()
            $0.bottom.equal()
            $0.trailing.equal()
        }
    }

    func applyTopConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.equal()
            $0.leading.greaterThanOrEqual()
            $0.bottom.lessThanOrEqual()
            $0.trailing.lessThanOrEqual()
            $0.centerX.equal()
            $0.leading.equal(priority: .defaultLow)
            $0.trailing.equal(priority: .defaultLow)
        }
    }

    func applyTopLeftConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.equal()
            $0.leading.equal()
            $0.bottom.lessThanOrEqual()
            $0.trailing.lessThanOrEqual()
        }
    }

    func applyTopRightConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.equal()
            $0.leading.greaterThanOrEqual()
            $0.bottom.lessThanOrEqual()
            $0.trailing.equal()
        }
    }

    func applyLeftConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.greaterThanOrEqual()
            $0.leading.equal()
            $0.bottom.lessThanOrEqual()
            $0.trailing.lessThanOrEqual()
            $0.centerY.equal()
            $0.top.equal(priority: .defaultLow)
            $0.bottom.equal(priority: .defaultLow)
        }
    }

    func applyRightConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.greaterThanOrEqual()
            $0.leading.greaterThanOrEqual()
            $0.bottom.lessThanOrEqual()
            $0.trailing.equal()
            $0.centerY.equal()
            $0.top.equal(priority: .defaultLow)
            $0.bottom.equal(priority: .defaultLow)
        }
    }

    func applyBottomConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.greaterThanOrEqual()
            $0.leading.greaterThanOrEqual()
            $0.bottom.equal()
            $0.trailing.lessThanOrEqual()
            $0.centerX.equal()
            $0.leading.equal(priority: .defaultLow)
            $0.trailing.equal(priority: .defaultLow)
        }
    }

    func applyBottomLeftConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.greaterThanOrEqual()
            $0.leading.equal()
            $0.bottom.equal()
            $0.trailing.lessThanOrEqual()
        }
    }

    func applyBottomRightConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.greaterThanOrEqual()
            $0.leading.greaterThanOrEqual()
            $0.bottom.equal()
            $0.trailing.equal()
        }
    }

    func applyVerticalConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.greaterThanOrEqual()
            $0.leading.equal()
            $0.bottom.lessThanOrEqual()
            $0.trailing.equal()
            $0.centerY.equal()
        }
    }

    func applyHorizontalConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.equal()
            $0.leading.greaterThanOrEqual()
            $0.bottom.equal()
            $0.trailing.lessThanOrEqual()
            $0.centerX.equal()
        }
    }

    func applyCenterConstraints(_ subview: UIView) {
        subview.anchor {
            $0.top.greaterThanOrEqual()
            $0.leading.greaterThanOrEqual()
            $0.bottom.lessThanOrEqual()
            $0.trailing.lessThanOrEqual()
            $0.centerY.equal()
            $0.centerX.equal()
            $0.top.equal(priority: .defaultLow)
            $0.bottom.equal(priority: .defaultLow)
            $0.leading.equal(priority: .defaultLow)
            $0.trailing.equal(priority: .defaultLow)
        }
    }
}
