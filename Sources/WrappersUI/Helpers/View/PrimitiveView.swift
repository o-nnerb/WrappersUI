//
//  PrimitiveView.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
open class PrimitiveView: UIView {

    @MainActor
    public init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    override public init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PrimitiveView {

    @objc
    open func buildHierarchy() {
        (self as? PrimitiveViewLoadable)?.loadView()
    }

    @objc
    open func setupConstraints() {}

    @objc
    open func applyAdditionalChanges() {}
}

private extension PrimitiveView {

    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
}
