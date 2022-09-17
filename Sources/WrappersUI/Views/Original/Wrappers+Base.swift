//
//  OriginalView.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension Wrappers where WrappedView == UIView {

    public class Base: WrapperView {}
}

extension Wrappers.Base: ViewCodable {

    func buildHierarchy() {
        append(wrappedView)
    }

    func setupConstraints() {
        wrappedView.anchor.edges.equal()
    }
}

public typealias BaseView<OriginalView: UIView> = Wrappers<OriginalView, UIView>.Base

extension WrapperViewable {

    public func eraseToOriginalView() -> BaseView<OriginalView> {
        .init(
            original: originalView,
            wrapped: self
        )
    }
}
