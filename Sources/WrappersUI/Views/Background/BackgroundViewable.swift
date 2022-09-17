//
//  BackgroundViewable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
public protocol BackgroundViewable: UIView {}

public extension BackgroundViewable {

    func background<Background: UIView>(
        _ background: Background,
        alignment: WrappersUI.Alignment? = nil,
        priority: UILayoutPriority = .required
    ) -> Wrappers<Self, Self>.Background<Background> {
        .init(
            original: self,
            wrapped: self,
            background: background,
            edges: alignment,
            priority: priority
        )
    }

    func background(_ color: UIColor) -> Wrappers<Self, Self>.Background<UIView> {
        background(
            UIView()
                .setting(\.backgroundColor, to: color)
        )
    }
}

public extension BackgroundViewable where Self: WrapperViewable {

    func background<Background: UIView>(
        _ background: Background,
        alignment: WrappersUI.Alignment? = nil,
        priority: UILayoutPriority = .required
    ) -> Wrappers<OriginalView, Self>.Background<Background> {
        .init(
            original: originalView,
            wrapped: self,
            background: background,
            edges: alignment,
            priority: priority
        )
    }

    func background(_ color: UIColor) -> Wrappers<OriginalView, Self>.Background<UIView> {
        background(
            UIView()
                .setting(\.backgroundColor, to: color)
        )
    }
}

extension UIView: BackgroundViewable {}
