//
//  AnyWrappedView.swift
//
//
//  Created by onnerb on 15/09/22.
//

import Foundation
import UIKit

@MainActor
public final class AnyWrappedView: Wrappers<UIView, UIView>.WrapperView {

    init<WrappedView>(_ view: WrappedView) where WrappedView: WrapperViewable {
        super.init(original: view.originalView, wrapped: view)
    }
}

extension AnyWrappedView: ViewCodable {

    func buildHierarchy() {
        append(wrappedView)
    }

    func setupConstraints() {
        wrappedView.anchor.edges.equal()
    }
}

extension WrapperViewable {

    public func eraseToAnyView() -> AnyWrappedView {
        AnyWrappedView(self)
    }
}
